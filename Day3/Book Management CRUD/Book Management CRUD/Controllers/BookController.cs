using Book_Management_CRUD.Models;
using Book_Management_CRUD.Services;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Book_Management_CRUD.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BookController : ControllerBase
    {
        private readonly BookService _bookService;

        public BookController(BookService bookService)
        {
            _bookService = bookService;
        }

        [HttpGet]
        public ActionResult<List<Book>> GetAll()
        {
            return _bookService.GetAll();
        }

        [HttpGet("{id}")]
        public ActionResult<Book> GetById(int id)
        {
            var book = _bookService.GetById(id);
            if (book == null) return NotFound();
            return book;
        }

        [HttpPost]
        public ActionResult<Book> AddBook([FromBody] Book book)
        {
            var createdBook = _bookService.AddBook(book);
            return CreatedAtAction(nameof(GetById), new { id = createdBook.Id }, createdBook);
        }

        [HttpPut("{id}")]
        public IActionResult UpdateBook(int id, [FromBody] Book book)
        {
            var success = _bookService.UpdateBook(id, book);
            if (!success) return NotFound();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteBook(int id)
        {
            var success = _bookService.DeleteBook(id);
            if (!success) return NotFound();
            return NoContent();
        }
    }
}
