using Microsoft.EntityFrameworkCore;
using Book_Management_CRUD.Models;

namespace Book_Management_CRUD.Data
{
    public class BookContext : DbContext
    {
        public BookContext(DbContextOptions<BookContext> options) : base(options) { }

        public DbSet<Book> Books { get; set; }
    }
}
