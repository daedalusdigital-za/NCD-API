namespace MH.Domain.ViewModel
{
    public class TrainingDocumentViewModel
    {
        public int Id { get; set; }
        public int TrainingSessionId { get; set; }
        public string? FileName { get; set; }
        public string? OriginalFileName { get; set; }
        public long FileSize { get; set; }
        public string? DocumentType { get; set; }
        public string? FileUrl { get; set; }
        public DateTime UploadedAt { get; set; }
        public int UploadedBy { get; set; }
        public string? MimeType { get; set; }
    }

    public class TrainingDocumentsListViewModel
    {
        public int TrainingSessionId { get; set; }
        public List<TrainingDocumentViewModel>? Documents { get; set; }
    }
}
