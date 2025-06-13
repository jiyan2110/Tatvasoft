using Book_Management_CRUD.Data;
using Book_Management_CRUD.Models;
using Microsoft.EntityFrameworkCore;

namespace Book_Management_CRUD.Services
{
    public class MissionSkillService
    {
        private readonly BookContext _context;

        public MissionSkillService(BookContext context)
        {
            _context = context;
        }

        // CREATE
        public async Task<MissionSkill> AddMissionSkillAsync(MissionSkill skill)
        {
            _context.MissionSkills.Add(skill);
            await _context.SaveChangesAsync();
            return skill;
        }

        // READ ALL
        public async Task<List<MissionSkill>> GetAllMissionSkillsAsync()
        {
            return await _context.MissionSkills.ToListAsync();
        }

        // READ BY ID
        public async Task<MissionSkill?> GetMissionSkillByIdAsync(int id)
        {
            return await _context.MissionSkills.FindAsync(id);
        }

        // UPDATE
        public async Task<bool> UpdateMissionSkillAsync(int id, MissionSkill updatedSkill)
        {
            var existingSkill = await _context.MissionSkills.FindAsync(id);
            if (existingSkill == null) return false;

            existingSkill.Name = updatedSkill.Name;
            existingSkill.IsActive = updatedSkill.IsActive;

            await _context.SaveChangesAsync();
            return true;
        }

        // DELETE
        public async Task<bool> DeleteMissionSkillAsync(int id)
        {
            var skill = await _context.MissionSkills.FindAsync(id);
            if (skill == null) return false;

            _context.MissionSkills.Remove(skill);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
