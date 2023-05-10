using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class ApplicationUserConfiguration : IEntityTypeConfiguration<ApplicationUser>
    {
        public void Configure(EntityTypeBuilder<ApplicationUser> builder)
        {
            builder.HasIndex(x => x.PositionId)
               .IsUnique(false);
            builder.HasIndex(x => x.PhoneNumber)
               .IsUnique(true);

            builder.Property(x => x.Email)
                .IsRequired()
                .HasMaxLength(250);
            builder.Property(x => x.PasswordHash)
                .IsRequired();
            builder.Property(x => x.Status)
               .IsRequired()
               .HasMaxLength(10);
            builder.Property(x => x.PositionId)
               .IsRequired(false);
            builder.Property(x => x.PhoneNumber)
                .IsRequired()
                .HasMaxLength(20);


            builder.HasOne(x => x.Position)
               .WithOne(y => y.User)
               .HasForeignKey<ApplicationUser>(z => z.PositionId)
               .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
