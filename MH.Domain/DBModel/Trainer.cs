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
        public string? Qualification { get; set; }
        public string? Experience { get; set; }
        public int Status { get; set; } // 1 = Active, 0 = Inactive
        public string? Location { get; set; }
        public string? Bio { get; set; }
    }
}
