using Book_Management_CRUD.Data;
using Book_Management_CRUD.DTOs;
using Book_Management_CRUD.Models;
using Microsoft.EntityFrameworkCore;

namespace Book_Management_CRUD.Services
{
    public class MissionService
    {
        private readonly BookContext _context;

        public MissionService(BookContext context)
        {
            _context = context;
        }

        public async Task<List<MissionReadDto>> GetAllAsync()
        {
            return await _context.Missions
                .Include(m => m.Country)
                .Include(m => m.City)
                .Include(m => m.MissionTheme)
                .Select(m => new MissionReadDto
                {
                    Id = m.Id,
                    MissionTitle = m.MissionTitle,
                    MissionDescription = m.MissionDescription,
                    MissionOrganisationName = m.MissionOrganisationName,
                    MissionOrganisationDetail = m.MissionOrganisationDetail,
                    CountryId = m.CountryId,
                    CountryName = m.Country.Name,
                    CityId = m.CityId,
                    CityName = m.City.Name,
                    MissionThemeId = m.MissionThemeId,
                    MissionThemeTitle = m.MissionTheme.Name,
                    MissionType = m.MissionType,
                    TotalSeats = m.TotalSeats,
                    MissionSkillId = m.MissionSkillId,
                    MissionImages = m.MissionImages,
                    MissionDocuments = m.MissionDocuments,
                    MissionAvailability = m.MissionAvailability,
                    MissionVideoUrl = m.MissionVideoUrl,
                    IsActive = m.IsActive
                })
                .ToListAsync();
        }

        public async Task<MissionReadDto?> GetByIdAsync(int id)
        {
            return await _context.Missions
                .Include(m => m.Country)
                .Include(m => m.City)
                .Include(m => m.MissionTheme)
                .Where(m => m.Id == id)
                .Select(m => new MissionReadDto
                {
                    Id = m.Id,
                    MissionTitle = m.MissionTitle,
                    MissionDescription = m.MissionDescription,
                    MissionOrganisationName = m.MissionOrganisationName,
                    MissionOrganisationDetail = m.MissionOrganisationDetail,
                    CountryId = m.CountryId,
                    CountryName = m.Country.Name,
                    CityId = m.CityId,
                    CityName = m.City.Name,
                    MissionThemeId = m.MissionThemeId,
                    MissionThemeTitle = m.MissionTheme.Name,
                    MissionType = m.MissionType,
                    TotalSeats = m.TotalSeats,
                    MissionSkillId = m.MissionSkillId,
                    MissionImages = m.MissionImages,
                    MissionDocuments = m.MissionDocuments,
                    MissionAvailability = m.MissionAvailability,
                    MissionVideoUrl = m.MissionVideoUrl,
                    IsActive = m.IsActive
                })
                .FirstOrDefaultAsync();
        }

        public async Task<Mission> CreateAsync(MissionDto dto)
        {
            var now = DateTime.UtcNow;

            var mission = new Mission
            {
                MissionTitle = dto.MissionTitle,
                MissionDescription = dto.MissionDescription,
                MissionOrganisationName = dto.MissionOrganisationName,
                MissionOrganisationDetail = dto.MissionOrganisationDetail,
                CountryId = dto.CountryId,
                CityId = dto.CityId,
                MissionThemeId = dto.MissionThemeId,
                MissionType = dto.MissionType,
                TotalSeats = dto.TotalSeats,
                MissionSkillId = dto.MissionSkillId,
                MissionImages = dto.MissionImages,
                MissionDocuments = dto.MissionDocuments,
                MissionAvailability = dto.MissionAvailability,
                MissionVideoUrl = dto.MissionVideoUrl,
                IsActive = dto.IsActive,

                // Internally handled fields
                StartDate = now,
                EndDate = now.AddMonths(1), // example logic
                CreatedAt = now
            };

            await _context.Missions.AddAsync(mission);
            await _context.SaveChangesAsync();
            return mission;
        }

        public async Task<bool> UpdateAsync(int id, MissionDto dto)
        {
            var existing = await _context.Missions.FindAsync(id);
            if (existing == null)
                return false;

            existing.MissionTitle = dto.MissionTitle;
            existing.MissionDescription = dto.MissionDescription;
            existing.MissionOrganisationName = dto.MissionOrganisationName;
            existing.MissionOrganisationDetail = dto.MissionOrganisationDetail;
            existing.CountryId = dto.CountryId;
            existing.CityId = dto.CityId;
            existing.MissionThemeId = dto.MissionThemeId;
            existing.MissionType = dto.MissionType;
            existing.TotalSeats = dto.TotalSeats;
            existing.MissionSkillId = dto.MissionSkillId;
            existing.MissionImages = dto.MissionImages;
            existing.MissionDocuments = dto.MissionDocuments;
            existing.MissionAvailability = dto.MissionAvailability;
            existing.MissionVideoUrl = dto.MissionVideoUrl;
            existing.IsActive = dto.IsActive;

            // Internally handled
            existing.UpdatedAt = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            var existing = await _context.Missions.FindAsync(id);
            if (existing == null)
                return false;

            _context.Missions.Remove(existing);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
