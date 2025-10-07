using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class District : BaseModel<int>
    {
        public string Name { get; set; } = null!;
        public string Code { get; set; } = null!;
        public int ProvinceId { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual Province? Province { get; set; }
        public virtual ICollection<Hospital> Hospitals { get; set; } = new List<Hospital>();
        public virtual ICollection<Clinic> Clinics { get; set; } = new List<Clinic>();
        public virtual ApplicationUser? CreatedByUser { get; set; }
        public virtual ApplicationUser? UpdateByUser { get; set; }
    }
}