
using Microsoft.AspNetCore.Http;

namespace MH.Domain.Model
{
    public class UserProfileModel
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string IdNumber { get; set; }
        public IFormFile Photo { get; set; }
        public string? Notes { get; set; }


    }
}
