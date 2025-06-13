using System.ComponentModel.DataAnnotations;

namespace Book_Management_CRUD.Models
{
    public class MissionSkill
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; } = string.Empty;

        public bool IsActive { get; set; } = true;
    }
}
