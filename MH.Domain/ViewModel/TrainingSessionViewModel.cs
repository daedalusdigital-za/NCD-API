using MH.Domain.DBModel;
using System.Text.Json.Serialization;

namespace MH.Domain.ViewModel
{
    public class TrainingSessionViewModel
    {
        public int? Id { get; set; }
        public string TrainingName { get; set; } = null!;
        public string TrainingType { get; set; } = null!;
        
        [JsonPropertyName("trainingDate")]
        public DateTime TrainingDate { get; set; }
        
        public int ProvinceId { get; set; }
        public string? ProvinceName { get; set; }
        public string Venue { get; set; } = null!;
        public int TrainerId { get; set; }
        public string? TrainerName { get; set; }
        public string TargetAudience { get; set; } = null!;
        public TrainingStatus Status { get; set; }
        public string? StatusText { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }
        public string? CreatedByUserName { get; set; }
    }
}