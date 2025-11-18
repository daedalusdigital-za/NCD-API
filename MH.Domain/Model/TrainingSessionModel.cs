using MH.Domain.DBModel;
using System.Text.Json.Serialization;

namespace MH.Domain.Model
{
    public class TrainingSessionModel
    {
        public int? Id { get; set; }
        public string TrainingName { get; set; } = null!;
        public string TrainingType { get; set; } = null!; // NDC Training workshop, Virtual training
        
        [JsonPropertyName("trainingDate")]
        public DateTime TrainingDate { get; set; }
        
        public int ProvinceId { get; set; }
        public string Venue { get; set; } = null!;
        public int TrainerId { get; set; }
        public string TargetAudience { get; set; } = null!;
        public TrainingStatus Status { get; set; }
    }
}