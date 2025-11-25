namespace MH.Domain.Model
{
    public class TrainingDocumentModel
    {
        public int? Id { get; set; }
        public int TrainingSessionId { get; set; }
        public string? FileName { get; set; }
        public string? OriginalFileName { get; set; }
        public long FileSize { get; set; }
        public string? FilePath { get; set; }
        public string? DocumentType { get; set; }
        public string? MimeType { get; set; }
        public int UploadedBy { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
