using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.Metrics;

namespace Book_Management_CRUD.Models
{
    public class Mission
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [MaxLength(200)]
        public string MissionTitle { get; set; }

        [Required]
        [MaxLength(2000)]
        public string MissionDescription { get; set; }

        [Required]
        [MaxLength(200)]
        public string MissionOrganisationName { get; set; }

        [MaxLength(1000)]
        public string? MissionOrganisationDetail { get; set; }

        [Required]
        public int CountryId { get; set; }

        [Required]
        public int CityId { get; set; }

        [Required]
        public int MissionThemeId { get; set; }

        [ForeignKey(nameof(CountryId))]
        public virtual Country Country { get; set; } = null!;

        [ForeignKey(nameof(CityId))]
        public virtual City City { get; set; } = null!;

        [ForeignKey(nameof(MissionThemeId))]
        public virtual MissionTheme MissionTheme { get; set; } = null!;

        [Required]
        public DateTime StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        [Required]
        [MaxLength(50)]
        public string MissionType { get; set; }

        public int? TotalSeats { get; set; }

        public DateTime? RegistrationDeadLine { get; set; }

        // You can later replace this with a many-to-many list of Skill objects
        public string? MissionSkillId { get; set; }

        [MaxLength(2000)]
        public string? MissionImages { get; set; }

        [MaxLength(2000)]
        public string? MissionDocuments { get; set; }

        [MaxLength(50)]
        public string? MissionAvailability { get; set; }

        [MaxLength(500)]
        public string? MissionVideoUrl { get; set; }

        public bool IsActive { get; set; } = true;

        [Required]
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        public DateTime? UpdatedAt { get; set; }
    }
}
