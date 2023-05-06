using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Patient : BaseModel<int>
    {
        public string PatientNumber { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Gender { get; set; }
        public string PhoneNumber { get; set; }
        public double Age { get; set; }

        //public DateTime? LastAppointmentDate { get; set; }
        //public DateTime? NextAppointmentDate { get; set; }
        public string? Notes { get; set; }
        public string? Diagnosis { get; set; }

        public bool? Gesttational { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string? Province { get; set; }
        public string? District { get; set; }
        public string? Institution { get; set; }


        public bool IsDeleted { get; set; }


        public virtual ICollection<Appointment> Appointment { get; set; }
        public virtual ICollection<MedicalHistory> MedicalHistory { get; set; }
        public virtual ApplicationUser CreatedByUser { get; set; }
        public virtual ApplicationUser UpdateByUser { get; set; }

    }
}
