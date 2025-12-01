using MH.Domain.DBModel;
using System.Text.Json.Serialization;

namespace MH.Domain.ViewModel
{
    public class TrainingSessionViewModel
    {
        public int? Id { get; set; }
        public string TrainingName { get; set; } = null!;
        public string TrainingType { get; set; } = null!;
        
        [JsonPropertyName("startDate")]
        public DateTime StartDate { get; set; }  // Changed from TrainingDate
        
        [JsonPropertyName("endDate")]
        public DateTime EndDate { get; set; }    // New field
        
        public int ProvinceId { get; set; }  // Foreign key
        public string? ProvinceName { get; set; }  // Resolved province name
        public string Venue { get; set; } = null!;
        public int TrainerId { get; set; }
        public Trainer? Trainer { get; set; }
        public string TargetAudience { get; set; } = null!;
        public int NumberOfParticipants { get; set; }
        public int Status { get; set; } = 1;  // Changed from TrainingStatus enum to int
        public string? StatusText { get; set; }
        public string? Hospital { get; set; }        // New fields from migration
        public string? TrainingObjectives { get; set; }
        public string? TrainingMaterials { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }
        public string? CreatedByUserName { get; set; }
    }
}