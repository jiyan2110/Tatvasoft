using Microsoft.EntityFrameworkCore;
using Book_Management_CRUD.Data;
using Book_Management_CRUD.Models;

namespace Book_Management_CRUD.Services
{
    public class MissionApplicationService
    {
        private readonly BookContext _context;

        public MissionApplicationService(BookContext context)
        {
            _context = context;
        }

        public async Task<(bool Success, int ApplicationId, string? ErrorMessage)> ApplyForMissionAsync(int userId, MissionApplicationRequest request)
        {
            var missionExists = await _context.Missions.AnyAsync(m => m.Id == request.MissionId && m.IsActive);
            if (!missionExists)
                return (false, 0, "Mission not found or inactive.");

            var alreadyApplied = await _context.MissionApplications.AnyAsync(a => a.MissionId == request.MissionId && a.UserId == userId);
            if (alreadyApplied)
                return (false, 0, "Already applied for this mission.");

            var application = new MissionApplication
            {
                UserId = userId,
                MissionId = request.MissionId,
                AppliedDate = DateTime.UtcNow,
                Seats = request.Seats,
                Status = false,
                applystatus = true
            };

            _context.MissionApplications.Add(application);
            await _context.SaveChangesAsync();

            return (true, application.Id, null);
        }

        public async Task<List<MissionApplication>> GetUserApplicationsAsync(int userId)
        {
            return await _context.MissionApplications
                .Include(a => a.Mission)
                .Where(a => a.UserId == userId)
                .ToListAsync();
        }

        public async Task<(bool Success, string? ErrorMessage)> CancelApplicationAsync(int applicationId, int userId)
        {
            var application = await _context.MissionApplications.FirstOrDefaultAsync(a => a.Id == applicationId && a.UserId == userId);
            if (application == null)
                return (false, "Application not found.");
            if (application.Status)
                return (false, "Cannot cancel approved application.");

            _context.MissionApplications.Remove(application);
            await _context.SaveChangesAsync();

            return (true, null);
        }

        public async Task<(bool Success, string? ErrorMessage)> ApproveApplicationAsync(int applicationId)
        {
            var application = await _context.MissionApplications.FindAsync(applicationId);
            if (application == null)
                return (false, "Application not found.");

            application.Status = true;
            application.applystatus = true;

            await _context.SaveChangesAsync();
            return (true, null);
        }

        public async Task<(bool Success, string? ErrorMessage)> RejectApplicationAsync(int applicationId)
        {
            var application = await _context.MissionApplications.FindAsync(applicationId);
            if (application == null)
                return (false, "Application not found.");

            application.Status = false;
            application.applystatus = false;

            await _context.SaveChangesAsync();
            return (true, null);
        }

        public async Task<object> GetApplicationStatisticsAsync()
        {
            var total = await _context.MissionApplications.CountAsync();
            var approved = await _context.MissionApplications.CountAsync(a => a.Status);
            var pending = total - approved;

            return new
            {
                totalApplications = total,
                approvedApplications = approved,
                pendingApplications = pending
            };
        }
    }

    public class MissionApplicationRequest
    {
        public int MissionId { get; set; }
        public int Seats { get; set; } = 1;
    }
}
