using System.Net;

namespace Book_Management_CRUD.Helpers
{
    public class ApiResponse
    {
        public ApiResponse()
        {
            Code = (int)HttpStatusCode.OK;
            Data = new object();
        }

        public ApiResponse(HttpStatusCode code, List<string> messages)
        {
            Code = (int)code;
            Messages = messages;
            Data = new object();
        }

        public ApiResponse(HttpStatusCode code, List<string> messages, dynamic data)
        {
            Code = (int)code;
            Messages = messages;
            Data = data;
        }

        public int Code { get; set; }
        public List<string> Messages { get; set; } = new List<string>();
        public dynamic Data { get; set; }
    }
}
