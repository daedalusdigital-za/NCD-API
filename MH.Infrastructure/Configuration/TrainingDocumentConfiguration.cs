using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class TrainingDocumentConfiguration : IEntityTypeConfiguration<TrainingDocument>
    {
        public void Configure(EntityTypeBuilder<TrainingDocument> builder)
        {
            builder.ToTable("TrainingDocuments");
            builder.HasKey(x => x.Id);

            // Configure properties
            builder.Property(x => x.TrainingSessionId);
            builder.Property(x => x.FileName);
            builder.Property(x => x.OriginalFileName);
            builder.Property(x => x.FileSize);
            builder.Property(x => x.FilePath);
            builder.Property(x => x.DocumentType);
            builder.Property(x => x.MimeType).HasDefaultValue("application/pdf");
            builder.Property(x => x.IsDeleted).HasDefaultValue(false);
            builder.Property(x => x.UploadedBy);

            // Base model audit properties - map to database column names
            builder.Property(x => x.DateCreated).HasColumnName("UploadedAt");
            builder.Property(x => x.CreatedBy).HasColumnName("CreatedBy");

            // Create index for better query performance
            builder.HasIndex(x => x.TrainingSessionId).HasName("IX_TrainingDocuments_TrainingSessionId");
        }
    }
}
