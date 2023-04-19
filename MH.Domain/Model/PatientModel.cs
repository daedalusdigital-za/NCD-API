
namespace MH.Domain.Model
{
    public class PatientModel
    {
        public int? Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Gender { get; set; }
        public string PhoneNumber { get; set; }
        public double Age { get; set; }
        public DateTime? LastAppointmentDate { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public string? Notes { get; set; }
        public string? Diagnosis { get; set; }

    }
}
