using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Province : BaseModel<int>
    {
        public string Name { get; set; } = null!;
        public string Code { get; set; } = null!;
        public long? Population { get; set; }
        public int? HealthFacilities { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual ICollection<Clinic> Clinics { get; set; } = new List<Clinic>();
        public virtual ApplicationUser? CreatedByUser { get; set; }
        public virtual ApplicationUser? UpdateByUser { get; set; }
    }
}