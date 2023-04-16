using Microsoft.AspNetCore.Http;

namespace MH.Domain.Model
{
    public class MedicalHistoryModel
    {
        public int? Id { get; set; }
        public IFormFile? Documents { get; set; }
        public string? Notes { get; set; }
        public IFormFile? Perscription { get; set; }
        public int RecordedBy { get; set; }
        public int PatientId { get; set; }
    }
}
