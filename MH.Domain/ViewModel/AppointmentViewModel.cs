
namespace MH.Domain.ViewModel
{
    public class AppointmentViewModel
    {
        public int? Id { get; set; }
        public DateTime DateOfAppointment { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }

        public DateTime DateCreated { get; set; }
    }
}
