namespace Book_Management_CRUD.DTOs
{
    public class CreateUserDto
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string PhoneNumber { get; set; }

        public string EmailAddress { get; set; }

        public string Password { get; set; }   // Optional, can be null or same

        public int RoleId { get; set; }
    }
}
