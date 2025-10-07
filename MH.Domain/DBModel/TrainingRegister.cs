using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class TrainingRegister : BaseModel<int>
    {
        public string SessionTitle { get; set; } = null!;
        public string Trainer { get; set; } = null!;
        public DateTime Date { get; set; }
        public string Venue { get; set; } = null!;
        public int Participants { get; set; }
        public string Duration { get; set; } = null!;
        public TrainingRegisterStatus Status { get; set; }
        public string Topic { get; set; } = null!;
        public decimal AttendanceRate { get; set; }
        public int CertificatesIssued { get; set; }
        public string? RegisterFile { get; set; }
        public int? TrainingSessionId { get; set; }
        public int? TrainerId { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual TrainingSession? TrainingSession { get; set; }
        public virtual Trainer? TrainerEntity { get; set; }
        public virtual ApplicationUser? CreatedByUser { get; set; }
        public virtual ApplicationUser? UpdateByUser { get; set; }
    }

    public enum TrainingRegisterStatus
    {
        Scheduled = 1,
        InProgress = 2,
        Completed = 3,
        Cancelled = 4
    }
}