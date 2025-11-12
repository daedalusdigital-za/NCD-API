using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class MedicalHistoryConfiguration : IEntityTypeConfiguration<MedicalHistory>
    {
        public void Configure(EntityTypeBuilder<MedicalHistory> builder)
        {
            // Apply base model configuration (maps DateCreated->CreatedAt, LastUpdated->UpdatedAt)
            builder.ConfigureBaseModel<MedicalHistory, int>();
            
            builder.HasIndex(x => x.CreatedBy)
               .IsUnique(false);
            builder.HasIndex(x => x.UpdatedBy)
               .IsUnique(false);
            builder.HasIndex(x => x.RecordedBy)
               .IsUnique(false);
            builder.HasIndex(x => x.PatientId)
               .IsUnique(false);

            builder.Property(x => x.AtInstitution)
                .HasMaxLength(250);
            builder.Property(x => x.HBA1C)
                .HasMaxLength(250);

            builder.Property(x => x.IsDeleted)
                .HasDefaultValue(false);


            builder.HasOne(x => x.RecordedUser)
               .WithOne(y => y.MedicalHistory)
               .HasForeignKey<MedicalHistory>(z => z.RecordedBy)
               .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Patient)
               .WithMany(y => y.MedicalHistory)
               .HasForeignKey(z => z.PatientId)
               .OnDelete(DeleteBehavior.Cascade);

            builder.HasOne(x => x.CreatedByUser)
               .WithOne(y => y.CreatedByMedicalHistory)
               .HasForeignKey<MedicalHistory>(z => z.CreatedBy)
               .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.UpdateByUser)
               .WithOne(y => y.UpdatedByMedicalHistory)
               .HasForeignKey<MedicalHistory>(z => z.UpdatedBy)
               .OnDelete(DeleteBehavior.Restrict);
        }
    }
}