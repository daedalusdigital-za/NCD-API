
namespace MH.Domain.Model
{
    public class UserModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string? PhoneNumber { get; set; }
        public int? PositionId { get; set; }
        public List<int> Roles { get; set; }
    }
}
