using Book_Management_CRUD.Data;
using Book_Management_CRUD.DTOs;
using Book_Management_CRUD.Models;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Text;

namespace Book_Management_CRUD.Services
{
    public class UserService
    {
        private readonly BookContext _context;

        public UserService(BookContext context)
        {
            _context = context;
        }

        public async Task<List<UserDto>> GetAllUsers()
        {
            return await _context.Users
                .Include(u => u.Role)
                .Where(u => !u.IsDeleted)
                .Select(u => new UserDto
                {
                    Id = u.Id,
                    FirstName = u.FirstName,
                    LastName = u.LastName,
                    PhoneNumber = u.PhoneNumber,
                    EmailAddress = u.EmailAddress,
                    RoleName = u.Role != null ? u.Role.Name : "N/A",
                    CreatedDate = u.CreatedDate,
                    ModifiedDate = u.ModifiedDate
                })
                .ToListAsync();
        }

        public async Task<UserDto> GetUserById(int id)
        {
            return await _context.Users
                .Include(u => u.Role)
                .Where(u => u.Id == id && !u.IsDeleted)
                .Select(u => new UserDto
                {
                    Id = u.Id,
                    FirstName = u.FirstName,
                    LastName = u.LastName,
                    PhoneNumber = u.PhoneNumber,
                    EmailAddress = u.EmailAddress,
                    RoleName = u.Role != null ? u.Role.Name : "N/A",
                    CreatedDate = u.CreatedDate,
                    ModifiedDate = u.ModifiedDate
                })
                .FirstOrDefaultAsync();
        }




        public async Task<UserDto> CreateUser(CreateUserDto dto, Role role)
        {
            var user = new User
            {
                FirstName = dto.FirstName,
                LastName = dto.LastName,
                PhoneNumber = dto.PhoneNumber,
                EmailAddress = dto.EmailAddress,
                Password = HashPassword(dto.Password), // Hashed
                RoleId = dto.RoleId,
                CreatedDate = DateTime.UtcNow,
                ModifiedDate = DateTime.UtcNow
            };

            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            return new UserDto
            {
                Id = user.Id,
                FirstName = user.FirstName,
                LastName = user.LastName,
                PhoneNumber = user.PhoneNumber,
                EmailAddress = user.EmailAddress,
                Password = user.Password,
                RoleName = role.Name,
                CreatedDate = user.CreatedDate,
                ModifiedDate = user.ModifiedDate
            };
        }


        public async Task<bool> UpdateUser(int id, CreateUserDto updatedUserDto)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null || user.IsDeleted)
                return false;

            var roleExists = await _context.Roles.AnyAsync(r => r.Id == updatedUserDto.RoleId);
            if (!roleExists)
                return false;

            user.FirstName = updatedUserDto.FirstName;
            user.LastName = updatedUserDto.LastName;
            user.PhoneNumber = updatedUserDto.PhoneNumber;
            user.EmailAddress = updatedUserDto.EmailAddress;
            user.Password = HashPassword(updatedUserDto.Password);
            user.RoleId = updatedUserDto.RoleId;
            user.ModifiedDate = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return true;
        }


        public async Task<bool> DeleteUser(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null || user.IsDeleted) return false;

            user.IsDeleted = true;
            user.ModifiedDate = DateTime.UtcNow;
            await _context.SaveChangesAsync();
            return true;
        }

        private string HashPassword(string password)
        {
            using var sha256 = SHA256.Create();
            var bytes = Encoding.UTF8.GetBytes(password);
            var hash = sha256.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }

    }
}
