using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Book_Management_CRUD.DTOs
{
    public class UploadFileDto
    {
        [FromForm(Name = "file")]
        public IFormFile File { get; set; }
    }
}
