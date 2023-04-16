using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Appointment : BaseModel<int>
    {
        public DateTime DateOfAppointment { get; set; }
        public int UserId { get; set; }
        public bool IsDeleted { get; set; }

        public virtual ApplicationUser User { get; set; }
        public virtual ApplicationUser CreatedByUser { get; set; }
        public virtual ApplicationUser UpdateByUser { get; set; }
    }
}
