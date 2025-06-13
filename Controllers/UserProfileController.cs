using Book_Management_CRUD.Models;
using Microsoft.AspNetCore.Mvc;
using Book_Management_CRUD.Data;
using Microsoft.EntityFrameworkCore;
using System;
[ApiController]
[Route("api/[controller]")]
public class UserProfileController : ControllerBase
{
    private readonly UserProfileService _service;
    private readonly IHttpContextAccessor _accessor;

    public UserProfileController(UserProfileService service, IHttpContextAccessor accessor)
    {
        _service = service;
        _accessor = accessor;
    }

    private int? GetUserId()
    {
        var userId = _accessor.HttpContext?.User?.FindFirst("id")?.Value;
        return int.TryParse(userId, out int id) ? id : (int?)null;
    }


    [HttpGet("profile")]
    public async Task<IActionResult> GetProfile()
    {
        var userId = GetUserId();
        if (userId == null)
            return Unauthorized(new { success = false, message = "User not logged in or claim missing" });

        var profile = await _service.GetUserProfile(userId.Value);

        if (profile == null)
            return NotFound(new { success = false, message = "Profile not found" });

        return Ok(new { success = true, data = profile });
    }

    [HttpPut("profile")]
    public async Task<IActionResult> UpdateProfile([FromBody] UserProfileDto dto)
    {
        var userId = GetUserId();
        await _service.UpdateUserProfile(userId.Value, dto);
        return Ok(new { success = true, message = "Profile updated successfully" });
    }
}
