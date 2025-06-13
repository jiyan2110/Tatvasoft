using Book_Management_CRUD.Models;

public class UserProfile
{
    public int Id { get; set; }
    public int UserId { get; set; }

    public string Bio { get; set; }
    public string ProfileImageUrl { get; set; }

    public User User { get; set; }
}
