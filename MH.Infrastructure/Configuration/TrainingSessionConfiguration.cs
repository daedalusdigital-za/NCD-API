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
            
            // ✅ CRITICAL: Map base model properties to match ACTUAL database column names after migrations
            // Migrations renamed: DateCreated → CreatedAt, LastUpdated → UpdatedAt
            builder.Property(x => x.DateCreated)
                .HasColumnName("CreatedAt")
                .HasColumnType("datetime2")
                .IsRequired();
                
            builder.Property(x => x.LastUpdated)
                .HasColumnName("UpdatedAt")
                .HasColumnType("datetime2")
                .IsRequired(false);
                
            builder.Property(x => x.CreatedBy)
                .IsRequired(false);  // Database allows NULL
                
            builder.Property(x => x.UpdatedBy)
                .IsRequired(false);  // Database allows NULL
            
            // Map other properties
            builder.Property(x => x.TrainingName).IsRequired();
            builder.Property(x => x.TrainingType).IsRequired();
            builder.Property(x => x.Date).HasColumnName("Date");  // StartDate → Date
            builder.Property(x => x.ProvinceId).IsRequired(false);  // Allow NULL
            builder.Property(x => x.Venue).IsRequired();
            builder.Property(x => x.TrainerId).IsRequired(false);  // Allow NULL
            builder.Property(x => x.TargetAudience).IsRequired();
            builder.Property(x => x.Status).IsRequired(false);  // Allow NULL
            builder.Property(x => x.IsDeleted);
            builder.Property(x => x.NumberOfParticipants);
                
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
            
            // Make TrainerId nullable
            builder.Property(x => x.TrainerId).IsRequired(false);
            builder.Property(x => x.Status).IsRequired(false);
        }
    }
}
