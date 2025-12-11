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
            
            // Map data properties to actual database column names
            builder.Property(x => x.TrainingName);
            builder.Property(x => x.TrainingType);
            builder.Property(x => x.Date).HasColumnName("TrainingDate");  // Date → TrainingDate
            builder.Property(x => x.ProvinceId);
            builder.Property(x => x.Venue);
            builder.Property(x => x.TrainerId);
            builder.Property(x => x.TargetAudience);
            builder.Property(x => x.NumberOfParticipants);
            builder.Property(x => x.Status);
            builder.Property(x => x.IsDeleted);
                
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
