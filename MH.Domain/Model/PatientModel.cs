
namespace MH.Domain.Model
{
    public class PatientModel
    {
        public int? Id { get; set; }
        public int UserId { get; set; }
        public DateTime? LastAppointmentDate { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public string? Notes { get; set; }
        public string? Diagnosis { get; set; }

    }
}
