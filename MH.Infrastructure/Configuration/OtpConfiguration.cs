using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class OtpConfiguration : IEntityTypeConfiguration<Otp>
    {
        public void Configure(EntityTypeBuilder<Otp> builder)
        {
            //builder.HasIndex(x => x.CreatedBy)
            //   .IsUnique(false);
            //builder.HasIndex(x => x.UpdatedBy)
            //   .IsUnique(false);

            //builder.Property(x => x.IsDeleted)
            //    .HasDefaultValue(false);
            builder.Property(x => x.Code)
                .HasMaxLength(100);
            builder.Property(x => x.MobileNo)
                .HasMaxLength(100);



            //builder.HasOne(x => x.CreatedByUser)
            //   .WithOne(y => y.CreatedByOtp)
            //   .HasForeignKey<Otp>(z => z.CreatedBy)
            //   .OnDelete(DeleteBehavior.Restrict);

            //builder.HasOne(x => x.UpdatedByUser)
            //   .WithOne(y => y.UpdatedByOtp)
            //   .HasForeignKey<Otp>(z => z.UpdatedBy)
            //   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}