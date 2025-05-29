using Microsoft.AspNetCore.Mvc;
using System.Net;
using Book_Management_CRUD.Helpers;
using Book_Management_CRUD.Models;
using Book_Management_CRUD.Services;

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
        public ActionResult<ApiResponse> GetAll()
        {
            var books = _bookService.GetAll();
            return new ApiResponse(HttpStatusCode.OK, new List<string> { CommonMessage.BookFetched }, books);
        }

        [HttpGet("{id}")]
        public ActionResult<ApiResponse> Get(int id)
        {
            var book = _bookService.GetById(id);
            if (book == null)
                return new ApiResponse(HttpStatusCode.NotFound, new List<string> { CommonMessage.BookNotFound });

            return new ApiResponse(HttpStatusCode.OK, new List<string> { CommonMessage.BookFetched }, book);
        }

        [HttpPost]
        public ActionResult<ApiResponse> AddBooks([FromBody] List<Book> books)
        {
            var result = _bookService.AddBooks(books);
            return new ApiResponse(HttpStatusCode.Created, new List<string> { CommonMessage.BookCreated }, result);
        }

        [HttpPut("{id}")]
        public ActionResult<ApiResponse> Update(int id, [FromBody] Book updatedBook)
        {
            var success = _bookService.UpdateBook(id, updatedBook);
            if (!success)
                return new ApiResponse(HttpStatusCode.NotFound, new List<string> { CommonMessage.BookNotFound });

            return new ApiResponse(HttpStatusCode.OK, new List<string> { CommonMessage.BookUpdated });
        }

        [HttpDelete("{id}")]
        public ActionResult<ApiResponse> Delete(int id)
        {
            var success = _bookService.DeleteBook(id);
            if (!success)
                return new ApiResponse(HttpStatusCode.NotFound, new List<string> { CommonMessage.BookNotFound });

            return new ApiResponse(HttpStatusCode.OK, new List<string> { CommonMessage.BookDeleted });
        }
    }
}
