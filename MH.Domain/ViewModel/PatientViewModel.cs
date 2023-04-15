
namespace MH.Domain.ViewModel
{
    public class PatientViewModel
    {
        public int? Id { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public DateTime? LastAppointmentDate { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public string? Notes { get; set; }
        public string? Diagnosis { get; set; }

        public DateTime DateCreated { get; set; }
    }
}
