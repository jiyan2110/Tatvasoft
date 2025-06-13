using Book_Management_CRUD.Data;
using Book_Management_CRUD.Models;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System;
using System.Collections.Generic;

namespace Book_Management_CRUD.Services
{
    public class AuthService
    {
        private readonly BookContext _context;

        public AuthService(BookContext context)
        {
            _context = context;
        }

        // Check if a user exists by EmailAddress (since you don't have Username)
        public async Task<bool> UserExists(string emailAddress)
        {
            return await _context.Users.AnyAsync(u => u.EmailAddress == emailAddress && !u.IsDeleted);
        }

        // Register a user using FirstName, LastName, PhoneNumber, EmailAddress, Password, RoleId
        public async Task<User> Register(string firstName, string lastName, string phoneNumber, string emailAddress, string password, int roleId)
        {
            if (await UserExists(emailAddress))
                throw new Exception("User with this email already exists.");

            var hashedPassword = HashPassword(password);

            var roleEntity = await _context.Roles.FirstOrDefaultAsync(r => r.Id == roleId);
            if (roleEntity == null)
                throw new Exception($"Role ID '{roleId}' not found.");

            var user = new User
            {
                FirstName = firstName,
                LastName = lastName,
                PhoneNumber = phoneNumber,
                EmailAddress = emailAddress,
                Password = hashedPassword,
                RoleId = roleEntity.Id,
                Role = roleEntity,
                CreatedDate = DateTime.UtcNow,
                ModifiedDate = DateTime.UtcNow,
                IsDeleted = false
            };

            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            // ✅ Add user profile after user is saved (user.Id is now available)
            var userProfile = new UserProfile
            {
                UserId = user.Id,
                Bio = "This is my Bio", 
                ProfileImageUrl = ""
            };

            _context.UserProfiles.Add(userProfile);
            await _context.SaveChangesAsync();

            return user;
        }

        // Login by EmailAddress and Password
        public async Task<User> Login(string emailAddress, string password)
        {
            var hashedPassword = HashPassword(password);

            var user = await _context.Users
                .Include(u => u.Role)
                .FirstOrDefaultAsync(u => u.EmailAddress == emailAddress && u.Password == hashedPassword && !u.IsDeleted);

            return user;
        }

        private string HashPassword(string password)
        {
            using var sha256 = SHA256.Create();
            var bytes = Encoding.UTF8.GetBytes(password);
            var hash = sha256.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }

        public async Task<List<Role>> GetRoles()
        {
            return await _context.Roles.ToListAsync();
        }
    }
}
