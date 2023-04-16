
namespace MH.Domain.Model
{
    public class AppointmentModel
    {
        public int? Id { get; set; }
        public DateTime DateOfAppointment { get; set; }
        public int UserId { get; set; }
    }
}
