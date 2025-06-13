using Book_Management_CRUD.Models;
using Book_Management_CRUD.Data;
using Microsoft.EntityFrameworkCore;
using System;

public class UserProfileService
{
    private readonly BookContext _context;

    public UserProfileService(BookContext context)
    {
        _context = context;
    }

    public async Task<UserProfile> GetUserProfile(int userId)
    {
        return await _context.UserProfiles
            .FirstOrDefaultAsync(p => p.UserId == userId);
    }

    public async Task<bool> UpdateUserProfile(int userId, UserProfileDto dto)
    {
        var profile = await _context.UserProfiles
            .FirstOrDefaultAsync(p => p.UserId == userId);

        if (profile == null)
        {
            profile = new UserProfile
            {
                UserId = userId,
                Bio = dto.Bio,
                ProfileImageUrl = dto.ProfileImageUrl
            };
            _context.Add(profile);
        }
        else
        {
            profile.Bio = dto.Bio;
            profile.ProfileImageUrl = dto.ProfileImageUrl;
            _context.Update(profile);
        }

        await _context.SaveChangesAsync();
        return true;
    }
}
