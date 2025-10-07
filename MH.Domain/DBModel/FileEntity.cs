using MH.Domain.Model;

namespace MH.Domain.DBModel
{
    public class FileEntity : BaseModel<int>
    {
        public string FileName { get; set; } = null!;
        public string FileType { get; set; } = null!;
        public long FileSize { get; set; }
        public string FilePath { get; set; } = null!;
        public string UploadedBy { get; set; } = null!;
        public DateTime UploadDate { get; set; }
        public FileCategory Category { get; set; }
        public int? AssociatedId { get; set; }
        public string? AssociatedType { get; set; }
        public bool IsPublic { get; set; }
        public bool IsDeleted { get; set; }

        // Navigation properties
        public virtual ApplicationUser? CreatedByUser { get; set; }
        public virtual ApplicationUser? UpdateByUser { get; set; }
    }

    public enum FileCategory
    {
        TrainingRegister = 1,
        Report = 2,
        Document = 3,
        Image = 4
    }
}