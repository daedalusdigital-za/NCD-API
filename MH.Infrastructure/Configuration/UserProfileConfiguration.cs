using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class UserProfileConfiguration : IEntityTypeConfiguration<UserProfile>
    {
        public void Configure(EntityTypeBuilder<UserProfile> builder)
        {
            builder.HasIndex(x => x.UserId)
              .IsUnique(false);
            builder.HasIndex(x => x.CreatedBy)
               .IsUnique(false);
            builder.HasIndex(x => x.UpdatedBy)
               .IsUnique(false);

            builder.Property(x => x.FirstName)
                .HasMaxLength(250);
            builder.Property(x => x.LastName)
                .HasMaxLength(250);
            builder.Property(x => x.IdNumber)
                .HasDefaultValue("")
                .HasMaxLength(250);

            builder.Property(x => x.IsDeleted)
                .HasDefaultValue(false);
        }
    }
}