
namespace MH.Domain.Model
{
    public class AppointmentModel
    {
        public int? Id { get; set; }
        public int PatientId { get; set; }
        public DateTime DateOfAppointment { get; set; }
    }
}
