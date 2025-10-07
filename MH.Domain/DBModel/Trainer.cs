using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class Trainer : BaseModel<int>
    {
        public string Name { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string Phone { get; set; } = null!;
        public string Province { get; set; } = null!;
        public string? Qualification { get; set; }
        public int Experience { get; set; }
        public TrainerStatus Status { get; set; }
        public string? Location { get; set; }
        public string? Bio { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual ICollection<TrainingSession> TrainingSessions { get; set; } = new List<TrainingSession>();
        public virtual ApplicationUser? CreatedByUser { get; set; }
        public virtual ApplicationUser? UpdateByUser { get; set; }
    }

    public enum TrainerStatus
    {
        Active = 1,
        Inactive = 2,
        OnLeave = 3
    }
}