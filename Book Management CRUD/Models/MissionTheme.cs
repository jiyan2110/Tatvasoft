using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Book_Management_CRUD.Models
{
    public class MissionTheme
    {
        [Key]
        public int MissionThemeId { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; } = string.Empty;

        public bool IsActive { get; set; } = true;

        public virtual ICollection<Mission> Missions { get; set; } = new List<Mission>();
    }
}
