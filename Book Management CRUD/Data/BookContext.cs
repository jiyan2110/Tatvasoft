using Microsoft.EntityFrameworkCore;
using Book_Management_CRUD.Models;

namespace Book_Management_CRUD.Data
{
    public class BookContext : DbContext
    {
        public BookContext(DbContextOptions<BookContext> options) : base(options) { }

        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<Mission> Missions { get; set; }
        public DbSet<MissionTheme> MissionThemes { get; set; }
        public DbSet<MissionSkill> MissionSkills { get; set; }
        public DbSet<MissionApplication> MissionApplications { get; set; }
        public DbSet<UserProfile> UserProfiles { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Table mappings
            modelBuilder.Entity<User>().ToTable("Users");
            modelBuilder.Entity<Role>().ToTable("Roles");
            modelBuilder.Entity<City>().ToTable("Cities");
            modelBuilder.Entity<Country>().ToTable("Countries");
            modelBuilder.Entity<Mission>().ToTable("Missions");
            modelBuilder.Entity<MissionTheme>().ToTable("MissionThemes");
            modelBuilder.Entity<MissionSkill>().ToTable("MissionSkills");
            modelBuilder.Entity<MissionApplication>().ToTable("MissionApplication");
            modelBuilder.Entity<UserProfile>().ToTable("UserProfiles");

            // User-Role relationship
            modelBuilder.Entity<User>()
                .HasOne(u => u.Role)
                .WithMany(r => r.Users)
                .HasForeignKey(u => u.RoleId)
                .OnDelete(DeleteBehavior.Restrict);

            // City-Country relationship
            modelBuilder.Entity<City>()
                .HasOne(c => c.Country)
                .WithMany(cn => cn.Cities)
                .HasForeignKey(c => c.CountryId)
                .OnDelete(DeleteBehavior.Restrict);

            // Mission relationships
            modelBuilder.Entity<Mission>()
                .HasOne(m => m.Country)
                .WithMany(cn => cn.Missions)
                .HasForeignKey(m => m.CountryId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Mission>()
                .HasOne(m => m.City)
                .WithMany(ct => ct.Missions)
                .HasForeignKey(m => m.CityId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Mission>()
                .HasOne(m => m.MissionTheme)
                .WithMany()
                .HasForeignKey(m => m.MissionThemeId)
                .OnDelete(DeleteBehavior.Restrict);

            // Seed roles (optional)
            modelBuilder.Entity<Role>().HasData(
                new Role { Id = 1, Name = "Admin"},
                new Role { Id = 2, Name = "User"}
            );

            base.OnModelCreating(modelBuilder);
        }
    }
}
