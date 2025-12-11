using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class TrainingSession : BaseModel<int>
    {
        // Override BaseModel audit properties
        public new DateTime DateCreated { get; set; }
        
        public new DateTime? LastUpdated { get; set; }
        
        public new int? CreatedBy { get; set; }
        
        public new int? UpdatedBy { get; set; }
        
        public string TrainingName { get; set; } = null!;
        public string TrainingType { get; set; } = null!;
        
        public DateTime Date { get; set; }
        
        public int ProvinceId { get; set; }  // Changed from string Province to int ProvinceId
        
        public string Venue { get; set; } = null!;
        public int? TrainerId { get; set; }
        public string TargetAudience { get; set; } = null!;
        public int? Status { get; set; } = 1;
        public bool IsDeleted { get; set; }
        public int NumberOfParticipants { get; set; }

        // Navigation properties
        public virtual Province? Province { get; set; }
        public virtual Trainer? Trainer { get; set; }
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