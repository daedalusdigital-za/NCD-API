using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Patient : BaseModel<int>
    {
        public int UserId { get; set; }
        public DateTime? LastAppointmentDate { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public string? Notes { get; set; }
        public string? Diagnosis { get; set; }
        public bool IsDeleted { get; set; }


        public virtual MedicalHistory MedicalHistory { get; set; }
        public virtual ApplicationUser User { get; set; }
        public virtual ApplicationUser CreatedByUser { get; set; }
        public virtual ApplicationUser UpdateByUser { get; set; }

    }
}
