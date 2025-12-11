using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class TrainingSessionConfiguration : IEntityTypeConfiguration<TrainingSession>
    {
        public void Configure(EntityTypeBuilder<TrainingSession> builder)
        {
            builder.ToTable("TrainingSession");
            builder.HasKey(x => x.Id);
            
            // ⚠️ CRITICAL: Ignore audit properties from BaseModel - let EF use shadow properties
            // The database schema doesn't match the BaseModel audit property names
            builder.Ignore(x => x.DateCreated);
            builder.Ignore(x => x.LastUpdated);
            builder.Ignore(x => x.CreatedBy);
            builder.Ignore(x => x.UpdatedBy);
            
            // Map Date property to TrainingDate column
            builder.Property(x => x.Date).HasColumnName("TrainingDate");
                
            // Province navigation property
            builder.HasOne(e => e.Province)
                .WithMany()
                .HasForeignKey(e => e.ProvinceId)
                .OnDelete(DeleteBehavior.Restrict);
            
            // Trainer navigation property
            builder.HasOne(e => e.Trainer)
                .WithMany()
                .HasForeignKey(e => e.TrainerId)
                .OnDelete(DeleteBehavior.SetNull);
            
            // Make foreign keys nullable
            builder.Property(x => x.ProvinceId).IsRequired(false);
            builder.Property(x => x.TrainerId).IsRequired(false);
            builder.Property(x => x.Status).IsRequired(false);
        }
    }
}
