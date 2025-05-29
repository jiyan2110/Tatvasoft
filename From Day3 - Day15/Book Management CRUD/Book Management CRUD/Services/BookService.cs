using Book_Management_CRUD.Data;
using Book_Management_CRUD.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace Book_Management_CRUD.Services
{
    public class BookService
    {
        private readonly BookContext _context;

        public BookService(BookContext context)
        {
            _context = context;
        }

        public List<Book> GetAll()
        {
            return _context.Books
                .Where(b => !b.IsDeleted)
                .ToList();
        }

        public Book GetById(int id)
        {
            return _context.Books
                .FirstOrDefault(b => b.Id == id && !b.IsDeleted);
        }

        public List<Book> AddBooks(List<Book> books)
        {
            _context.Books.AddRange(books);
            _context.SaveChanges();
            return books;
        }

        public bool UpdateBook(int id, Book updatedBook)
        {
            var book = _context.Books.FirstOrDefault(b => b.Id == id && !b.IsDeleted);
            if (book == null) return false;

            book.Title = updatedBook.Title;
            book.Author = updatedBook.Author;
            book.Genre = updatedBook.Genre;

            _context.SaveChanges();
            return true;
        }

        public bool DeleteBook(int id)
        {
            var book = _context.Books.FirstOrDefault(b => b.Id == id && !b.IsDeleted);
            if (book == null) return false;

            book.IsDeleted = true; // Soft delete
            _context.SaveChanges();
            return true;
        }
    }
}
