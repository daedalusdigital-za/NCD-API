using MH.Domain.DBModel;

namespace MH.Domain.Model
{
    public class TrainingSessionModel
    {
        public int? Id { get; set; }
        public string TrainingName { get; set; } = null!;
        public string TrainingType { get; set; } = null!;
        public string? Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
        public string Province { get; set; } = null!;
        public string Hospital { get; set; } = null!;
        public string Venue { get; set; } = null!;
        public int TrainerId { get; set; }
        public int NumberOfParticipants { get; set; }
        public string TargetAudience { get; set; } = null!;
        public string? Objectives { get; set; }
        public string? Materials { get; set; }
        public TrainingStatus Status { get; set; }
    }
}