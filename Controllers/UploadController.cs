using Book_Management_CRUD.DTOs;
using Book_Management_CRUD.Services;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace Book_Management_CRUD.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UploadController : ControllerBase
    {
        private readonly UploadService _uploadService;

        public UploadController(UploadService uploadService)
        {
            _uploadService = uploadService;
        }

        [HttpPost("image")]
        public async Task<IActionResult> UploadImage([FromForm] UploadFileDto dto)
        {
            var storedFileName = await _uploadService.SaveImageAsync(dto.File);
            return Ok(new { fileName = storedFileName });
        }

        [HttpPost("document")]
        public async Task<IActionResult> UploadDocument([FromForm] UploadFileDto dto)
        {
            var storedFileName = await _uploadService.SaveDocumentAsync(dto.File);
            return Ok(new { fileName = storedFileName });
        }
    }
}
