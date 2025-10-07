using MH.Domain.DBModel;

namespace MH.Domain.ViewModel
{
    public class TrainerViewModel
    {
        public int? Id { get; set; }
        public string Name { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string Phone { get; set; } = null!;
        public string Province { get; set; } = null!;
        public string? Qualification { get; set; }
        public int Experience { get; set; }
        public TrainerStatus Status { get; set; }
        public string? StatusText { get; set; }
        public string? Location { get; set; }
        public string? Bio { get; set; }
        public int? TotalTrainingSessions { get; set; }
        public int? CompletedSessions { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }
        public string? CreatedByUserName { get; set; }
    }
}