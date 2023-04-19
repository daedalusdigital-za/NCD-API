using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class AppointmentConfiguration : IEntityTypeConfiguration<Appointment>
    {
        public void Configure(EntityTypeBuilder<Appointment> builder)
        {
            builder.HasIndex(x => x.CreatedBy)
               .IsUnique(false);
            builder.HasIndex(x => x.UpdatedBy)
               .IsUnique(false);
            //builder.HasIndex(x => x.UserId)
            //   .IsUnique(false);

            builder.Property(x => x.IsDeleted)
                .HasDefaultValue(false);


            builder.HasOne(x => x.CreatedByUser)
               .WithOne(y => y.CreatedByAppointment)
               .HasForeignKey<Appointment>(z => z.CreatedBy)
               .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.UpdateByUser)
               .WithOne(y => y.UpdatedByAppointment)
               .HasForeignKey<Appointment>(z => z.UpdatedBy)
               .OnDelete(DeleteBehavior.Restrict);
        }
    }
}