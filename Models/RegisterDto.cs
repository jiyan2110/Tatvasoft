using System.ComponentModel.DataAnnotations;

namespace Book_Management_CRUD.DTOs
{
    public class RegisterDto
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public string PhoneNumber { get; set; }
        [Required]
        public string EmailAddress { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public int RoleId { get; set; }
    }

}