using Book_Management_CRUD.Models;
using Microsoft.EntityFrameworkCore;
using Book_Management_CRUD.Data;

namespace Book_Management_CRUD.Services
{
    public class MissionThemeService
    {
        private readonly BookContext _context;

        public MissionThemeService(BookContext context)
        {
            _context = context;
        }

        public async Task<List<MissionTheme>> GetAllAsync()
        {
            return await _context.MissionThemes.ToListAsync();
        }

        public async Task<MissionTheme?> GetByIdAsync(int id)
        {
            return await _context.MissionThemes.FindAsync(id);
        }

        public async Task<MissionTheme> CreateAsync(MissionTheme theme)
        {
            _context.MissionThemes.Add(theme);
            await _context.SaveChangesAsync();
            return theme;
        }

        public async Task<bool> UpdateAsync(int id, MissionTheme updatedTheme)
        {
            var existing = await _context.MissionThemes.FindAsync(id);
            if (existing == null) return false;

            existing.Name = updatedTheme.Name;
            existing.IsActive = updatedTheme.IsActive;

            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            var existing = await _context.MissionThemes.FindAsync(id);
            if (existing == null) return false;

            _context.MissionThemes.Remove(existing);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
