using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Book_Management_CRUD.Models
{
    public class Country
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; } = string.Empty;

        [MaxLength(10)]
        public string? Code { get; set; }

        public bool IsActive { get; set; } = true;

        public virtual ICollection<City> Cities { get; set; } = new List<City>();

        public virtual ICollection<Mission> Missions { get; set; } = new List<Mission>();
    }
}
