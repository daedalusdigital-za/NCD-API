using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Clinic : BaseModel<int>
    {
        public string Name { get; set; } = null!;
        public string Code { get; set; } = null!;
        public int ProvinceId { get; set; }
        public int? DistrictId { get; set; }
        public ClinicType Type { get; set; }
        public string? Address { get; set; }
        public string? ContactNumber { get; set; }
        public string? Email { get; set; }
        public ClinicStatus Status { get; set; }
        public string? Services { get; set; } // JSON array of services
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual Province? Province { get; set; }
        public virtual District? District { get; set; }
        public virtual ApplicationUser? CreatedByUser { get; set; }
        public virtual ApplicationUser? UpdateByUser { get; set; }
    }

    public enum ClinicType
    {
        PrimaryHealthcareClinic = 1,
        CommunityHealthCentre = 2,
        SpecializedClinic = 3,
        MobileClinic = 4
    }

    public enum ClinicStatus
    {
        Active = 1,
        Inactive = 2,
        UnderConstruction = 3
    }
}