
// 1. Models/Role.cs - Fixed property naming consistency
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Book_Management_CRUD.Models
{
    public class Role
    {
        [Key]
        public int Id { get; set; } // Changed from 'id' to 'Id' for consistency

        [Required]
        public string Name { get; set; } // Changed from 'name' to 'Name' for consistency

        public ICollection<User> Users { get; set; }
    }
}