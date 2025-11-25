using MH.Domain.IEntity;
using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Trainer : BaseModel<int>
    {
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string? Specialization { get; set; }
        public int? Experience { get; set; }
        public string? Certification { get; set; }
        public bool IsActive { get; set; } = true;
        public bool IsDeleted { get; set; }
        public int? ProvinceId { get; set; }
        public new DateTime? LastUpdated { get; set; }
        public new int? UpdatedBy { get; set; }
        public int? ModifiedBy { get; set; }
    }
}
