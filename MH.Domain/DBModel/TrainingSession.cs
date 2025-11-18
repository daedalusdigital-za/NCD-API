using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class TrainingSession : BaseModel<int>
    {
        public string TrainingName { get; set; } = null!;
        public string TrainingType { get; set; } = null!; // NDC Training workshop, Virtual training
        public DateTime TrainingDate { get; set; }
        public int ProvinceId { get; set; }
        public string Venue { get; set; } = null!;
        public int TrainerId { get; set; }
        public string TargetAudience { get; set; } = null!;
        public TrainingStatus Status { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual Province? Province { get; set; }
        public virtual Trainer? Trainer { get; set; }
        public virtual ICollection<TrainingRegister> TrainingRegisters { get; set; } = new List<TrainingRegister>();
        public virtual ApplicationUser? CreatedByUser { get; set; }
        public virtual ApplicationUser? UpdateByUser { get; set; }
    }

    public enum TrainingStatus
    {
        Planned = 1,
        Scheduled = 2,
        InProgress = 3,
        Completed = 4,
        Cancelled = 5
    }
}