using Book_Management_CRUD.Models;
using System.Collections.Generic;
using System.Linq;

namespace Book_Management_CRUD.Services
{
    public class BookService
    {
        private static List<Book> _books = new List<Book>();
        private static int _nextId = 1;

        public List<Book> GetAll() => _books;

        public Book GetById(int id) => _books.FirstOrDefault(b => b.Id == id);

        public Book AddBook(Book book)
        {
            book.Id = _nextId++;
            _books.Add(book);
            return book;
        }

        public bool UpdateBook(int id, Book updatedBook)
        {
            var book = GetById(id);
            if (book == null) return false;

            book.Title = updatedBook.Title;
            book.Author = updatedBook.Author;
            book.Genre = updatedBook.Genre;
            return true;
        }

        public bool DeleteBook(int id)
        {
            var book = GetById(id);
            if (book == null) return false;

            _books.Remove(book);
            return true;
        }
    }
}
