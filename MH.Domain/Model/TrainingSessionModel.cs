using MH.Domain.DBModel;

namespace MH.Domain.Model
{
    public class TrainingSessionModel
    {
        public int? Id { get; set; }
        public string TrainingName { get; set; } = null!;
        public string TrainingType { get; set; } = null!; // NDC Training workshop, Virtual training
        public DateTime Date { get; set; }
        public string Province { get; set; } = null!;
        public string Venue { get; set; } = null!;
        public int TrainerId { get; set; }
        public string TargetAudience { get; set; } = null!;
        public TrainingStatus Status { get; set; }
    }
}