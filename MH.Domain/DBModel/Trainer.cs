using MH.Domain.IEntity;
using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Trainer : BaseModel<int>
    {
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public int? ProvinceId { get; set; }
        public string Status { get; set; } = "Active"; // Valid values: 'Active', 'Inactive', 'On Leave'
        public string? Location { get; set; }
    }
}
