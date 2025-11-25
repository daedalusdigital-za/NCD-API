using MH.Domain.IEntity;
using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class TrainingDocument : BaseModel<int>
    {
        public int TrainingSessionId { get; set; }
        public string? FileName { get; set; }
        public string? OriginalFileName { get; set; }
        public long FileSize { get; set; }
        public string? FilePath { get; set; }
        public string? DocumentType { get; set; } // "Register", "AttendanceSheet", "Materials"
        public string? MimeType { get; set; } = "application/pdf";
        public bool IsDeleted { get; set; }
        public int UploadedBy { get; set; }
    }
}
