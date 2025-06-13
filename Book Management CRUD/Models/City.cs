using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.Metrics;

namespace Book_Management_CRUD.Models
{
    public class City
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(100)]
        public string Name { get; set; } = string.Empty;

        [Required]
        public int CountryId { get; set; }

        public bool IsActive { get; set; } = true;

        [ForeignKey(nameof(CountryId))]
        public virtual Country Country { get; set; } = null!;

        public virtual ICollection<Mission> Missions { get; set; } = new List<Mission>();
    }
}
