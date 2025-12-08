using MH.Domain.DBModel;
using System.Text.Json.Serialization;

namespace MH.Domain.Model
{
    public class TrainingSessionModel
    {
        public int? Id { get; set; }
        public string? TrainingName { get; set; }  // Made nullable for PATCH
        public string? TrainingType { get; set; }  // Made nullable for PATCH
        
        [JsonPropertyName("startDate")]
        public DateTime StartDate { get; set; }  // Changed from TrainingDate
        
        public int ProvinceId { get; set; }  // Foreign key to Province table
        public string? Venue { get; set; }  // Made nullable for PATCH
        public int TrainerId { get; set; }
        public string? TargetAudience { get; set; }  // Made nullable for PATCH
        public int NumberOfParticipants { get; set; }
        public int Status { get; set; } = 1;  // Changed from TrainingStatus enum to int
    }
}