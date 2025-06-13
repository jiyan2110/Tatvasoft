using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Book_Management_CRUD.Models
{
    public class MissionApplication
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [ForeignKey("Mission")]
        public int MissionId { get; set; }

        [Required]
        [ForeignKey("User")]
        public int UserId { get; set; }

        [Required]
        public DateTime AppliedDate { get; set; }

        [Required]
        public int Seats { get; set; } = 1;

        public bool Status { get; set; } = false; // Approved or not

        public bool applystatus { get; set; } = true; // Applied or rejected

        // Navigation properties
        public virtual Mission Mission { get; set; }
        public virtual User User { get; set; }
    }
}
