using System.ComponentModel.DataAnnotations;

namespace Book_Management_CRUD.DTOs
{
    public class LoginDto
    {
        [Required]
       
        public string EmailAddress { get; set; }

        [Required]
        public string Password { get; set; }
    }
}