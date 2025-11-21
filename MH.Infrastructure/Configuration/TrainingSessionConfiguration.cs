using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class TrainingSessionConfiguration : IEntityTypeConfiguration<TrainingSession>
    {
        public void Configure(EntityTypeBuilder<TrainingSession> builder)
        {
            builder.ToTable("TrainingSession"); // Singular table name as per database
                
            // Temporarily disable foreign key relationships to avoid schema conflicts
            // builder.HasOne(e => e.Trainer)
            //     .WithMany(t => t.TrainingSessions)
            //     .HasForeignKey(e => e.TrainerId)
            //     .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
