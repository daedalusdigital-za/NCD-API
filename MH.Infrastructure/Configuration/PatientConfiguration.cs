using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class PatientConfiguration : IEntityTypeConfiguration<Patient>
    {
        public void Configure(EntityTypeBuilder<Patient> builder)
        {
            builder.HasIndex(x => x.CreatedBy)
               .IsUnique(false);
            builder.HasIndex(x => x.UpdatedBy)
               .IsUnique(false);

            builder.Property(x => x.Name)
                .HasMaxLength(250);
            builder.Property(x => x.Surname)
                .HasMaxLength(250);
            builder.Property(x => x.Gender)
                .HasMaxLength(250);
            builder.Property(x => x.PhoneNumber)
                .HasMaxLength(50);

            builder.HasOne(x => x.CreatedByUser)
               .WithOne(y => y.CreatedByPatient)
               .HasForeignKey<Patient>(z => z.CreatedBy)
               .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.UpdateByUser)
               .WithOne(y => y.UpdatedByPatient)
               .HasForeignKey<Patient>(z => z.UpdatedBy)
               .OnDelete(DeleteBehavior.Restrict);
        }
    }
}