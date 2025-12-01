using MH.Domain.DBModel;
using System.Text.Json.Serialization;

namespace MH.Domain.Model
{
    public class TrainingSessionModel
    {
        public int? Id { get; set; }
        public string TrainingName { get; set; } = null!;
        public string TrainingType { get; set; } = null!; // NDC Training workshop, Virtual training
        
        [JsonPropertyName("startDate")]
        public DateTime StartDate { get; set; }  // Changed from TrainingDate
        
        [JsonPropertyName("endDate")]
        public DateTime EndDate { get; set; }    // New field
        
        public int ProvinceId { get; set; }  // Foreign key to Province table
        public string Venue { get; set; } = null!;
        public int TrainerId { get; set; }
        public string TargetAudience { get; set; } = null!;
        public int NumberOfParticipants { get; set; }
        public int Status { get; set; } = 1;  // Changed from TrainingStatus enum to int
        public string? Hospital { get; set; }        // New fields from migration
        public string? TrainingObjectives { get; set; }
        public string? TrainingMaterials { get; set; }
    }
}