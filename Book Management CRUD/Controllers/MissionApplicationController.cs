using Microsoft.AspNetCore.Mvc;
using Book_Management_CRUD.Models;
using Book_Management_CRUD.Services;

namespace Book_Management_CRUD.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MissionApplicationController : ControllerBase
    {
        private readonly MissionApplicationService _service;

        public MissionApplicationController(MissionApplicationService service)
        {
            _service = service;
        }

        [HttpPost]
        public async Task<IActionResult> Apply([FromQuery] int userId, [FromBody] MissionApplicationRequest request)
        {
            var result = await _service.ApplyForMissionAsync(userId, request);
            if (!result.Success)
                return BadRequest(new { result.ErrorMessage });

            return Ok(new { result.ApplicationId });
        }

        [HttpGet("user/{userId}")]
        public async Task<IActionResult> GetUserApplications(int userId)
        {
            var apps = await _service.GetUserApplicationsAsync(userId);
            return Ok(apps);
        }

        [HttpDelete("cancel/{applicationId}")]
        public async Task<IActionResult> Cancel(int applicationId, [FromQuery] int userId)
        {
            var result = await _service.CancelApplicationAsync(applicationId, userId);
            if (!result.Success)
                return BadRequest(new { result.ErrorMessage });

            return Ok(new { Message = "Application cancelled." });
        }

        [HttpPut("approve/{applicationId}")]
        public async Task<IActionResult> Approve(int applicationId)
        {
            var result = await _service.ApproveApplicationAsync(applicationId);
            if (!result.Success)
                return BadRequest(new { result.ErrorMessage });

            return Ok(new { Message = "Application approved." });
        }

        [HttpPut("reject/{applicationId}")]
        public async Task<IActionResult> Reject(int applicationId)
        {
            var result = await _service.RejectApplicationAsync(applicationId);
            if (!result.Success)
                return BadRequest(new { result.ErrorMessage });

            return Ok(new { Message = "Application rejected." });
        }

        [HttpGet("statistics")]
        public async Task<IActionResult> GetStatistics()
        {
            var stats = await _service.GetApplicationStatisticsAsync();
            return Ok(stats);
        }
    }
}
