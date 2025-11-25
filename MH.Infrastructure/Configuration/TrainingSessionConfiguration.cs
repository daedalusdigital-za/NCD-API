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
            
            // Configure base model properties with correct column mappings
            builder.Property(x => x.DateCreated).HasColumnName("CreatedDate");
            builder.Property(x => x.LastUpdated).HasColumnName("LastUpdated");
            builder.Property(x => x.CreatedBy).HasColumnName("CreatedBy");
            builder.Property(x => x.UpdatedBy).HasColumnName("UpdatedBy");
            
            // Configure other properties
            builder.Property(x => x.TrainingName);
            builder.Property(x => x.TrainingType);
            builder.Property(x => x.Date).HasColumnName("TrainingDate");
            builder.Property(x => x.Province).HasColumnName("ProvinceId");
                
            // Temporarily disable foreign key relationships to avoid schema conflicts
            // builder.HasOne(e => e.Trainer)
            //     .WithMany(t => t.TrainingSessions)
            //     .HasForeignKey(e => e.TrainerId)
            //     .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
