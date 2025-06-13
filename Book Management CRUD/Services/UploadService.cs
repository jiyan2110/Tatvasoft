using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.IO;
using System.Threading.Tasks;

namespace Book_Management_CRUD.Services
{
    public class UploadService
    {
        private readonly IWebHostEnvironment _env;

        public UploadService(IWebHostEnvironment env)
        {
            _env = env;
        }

        public async Task<string> SaveImageAsync(IFormFile file)
        {
            return await SaveFileAsync(file, "uploads/images");
        }

        public async Task<string> SaveDocumentAsync(IFormFile file)
        {
            return await SaveFileAsync(file, "uploads/docs");
        }

        private async Task<string> SaveFileAsync(IFormFile file, string relativePath)
        {
            if (file == null || file.Length == 0)
                throw new ArgumentException("Invalid file");

            var rootPath = _env.WebRootPath ?? _env.ContentRootPath;
            var folderPath = Path.Combine(rootPath, relativePath);

            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            var uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
            var fullPath = Path.Combine(folderPath, uniqueFileName);

            using (var stream = new FileStream(fullPath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return uniqueFileName;
        }
    }
}
