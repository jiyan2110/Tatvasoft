namespace Book_Management_CRUD.DTOs
{
    public class MissionDto
    {
        public string MissionTitle { get; set; }
        public string MissionDescription { get; set; }
        public string MissionOrganisationName { get; set; }
        public string? MissionOrganisationDetail { get; set; }
        public int CountryId { get; set; }
        public int CityId { get; set; }
        public int MissionThemeId { get; set; }
        public string MissionType { get; set; }
        public int? TotalSeats { get; set; }
        public string? MissionSkillId { get; set; }  // Consider changing to List<int> if multiple skills
        public string? MissionImages { get; set; }
        public string? MissionDocuments { get; set; }
        public string? MissionAvailability { get; set; }
        public string? MissionVideoUrl { get; set; }
        public bool IsActive { get; set; } = true;
    }
}
