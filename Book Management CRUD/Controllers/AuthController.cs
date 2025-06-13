using Book_Management_CRUD.Models;
using Book_Management_CRUD.Services;
using Book_Management_CRUD.Helpers;
using Book_Management_CRUD.DTOs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using System;

namespace Book_Management_CRUD.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly AuthService _authService;
        private readonly JwtTokenHelper _jwtTokenHelper;

        public AuthController(AuthService authService, JwtTokenHelper jwtTokenHelper)
        {
            _authService = authService;
            _jwtTokenHelper = jwtTokenHelper;
        }

        [HttpPost("register")]
        [AllowAnonymous]
        public async Task<IActionResult> Register([FromBody] RegisterDto request)
        {
            try
            {
                if (!ModelState.IsValid)
                    return BadRequest(ModelState);

                if (await _authService.UserExists(request.EmailAddress))
                    return BadRequest("Email already registered.");

                if (request.RoleId <= 0)
                    return BadRequest("A valid RoleId is required.");

                var user = await _authService.Register(
                    request.FirstName,
                    request.LastName,
                    request.PhoneNumber,
                    request.EmailAddress,
                    request.Password,
                    request.RoleId
                );

                return Ok(new
                {
                    user.Id,
                    user.FirstName,
                    user.LastName,
                    user.PhoneNumber,
                    user.EmailAddress,
                    Role = user.Role?.Name,
                    CreatedAt = user.CreatedDate
                });
            }
            catch (Exception ex)
            {
                return BadRequest($"Registration failed: {ex.Message}");
            }
        }

        [HttpPost("login")]
        [AllowAnonymous]
        public async Task<IActionResult> Login([FromBody] LoginDto request)
        {
            try
            {
                if (!ModelState.IsValid)
                    return BadRequest(ModelState);

                if (string.IsNullOrEmpty(request.EmailAddress) || string.IsNullOrEmpty(request.Password))
                    return BadRequest("Email and password are required.");

                var user = await _authService.Login(request.EmailAddress, request.Password);
                if (user == null)
                    return Unauthorized("Invalid email or password.");

                var token = _jwtTokenHelper.GenerateToken(user.EmailAddress, user.Role?.Name ?? "User", user.Id);

                return Ok(new
                {
                    token,
                    user.EmailAddress,
                    user.FirstName,
                    user.LastName,
                    Role = user.Role?.Name,
                    user.Id
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Login failed: {ex.Message}");
            }
        }

        [HttpGet("roles")]
        public async Task<ActionResult<List<Role>>> GetRoles()
        {
            var roles = await _authService.GetRoles();
            return Ok(roles);
        }
    }
}
