
namespace MH.Domain.ViewModel
{
    public class UserViewModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string? PositionName { get; set; }
        public string? PositionDesc { get; set; }
        public string? ContactName { get; set; }
        public int? ContactTypeId { get; set; }
        public string? ContactTypeName { get; set; }
        public int? ContactDataTypeId { get; set; }
        public string? ContactDataTypeName { get; set; }
        public int? ContactEntityId { get; set; }
        public string? ContactEntityName { get; set; }
        public string? ContactData { get; set; }
        public List<string> UserRoles { get; set; }
    }
}
