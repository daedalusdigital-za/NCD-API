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
            
            // Configure properties - DO NOT map base properties as they use default conventions
            builder.Property(x => x.TrainingName);
            builder.Property(x => x.TrainingType);
            builder.Property(x => x.Date).HasColumnName("TrainingDate");
            builder.Property(x => x.ProvinceId).HasColumnName("ProvinceId");
            builder.Property(x => x.Venue);
            builder.Property(x => x.TrainerId);
            builder.Property(x => x.TargetAudience);
            builder.Property(x => x.Status);
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
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
