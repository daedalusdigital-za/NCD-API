
namespace MH.Domain.ViewModel
{
    public class AppointmentViewModel
    {
        public int? Id { get; set; }
        public int PatientId { get; set; }
        public DateTime DateOfAppointment { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string PhoneNumber { get; set; }
        public double Age { get; set; }
        public string Gender { get; set; }

        public DateTime DateCreated { get; set; }
    }
}
