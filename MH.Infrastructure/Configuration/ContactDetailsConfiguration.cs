using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class ContactDetailsConfiguration : IEntityTypeConfiguration<ContactDetails>
    {
        public void Configure(EntityTypeBuilder<ContactDetails> builder)
        {
            builder.HasIndex(x => x.ContactDataTypeId)
               .IsUnique(false);
            builder.HasIndex(x => x.ContactTypeId)
               .IsUnique(false);
            builder.HasIndex(x => x.ContactEntityId)
               .IsUnique(false);
            builder.HasIndex(x => x.CreatedBy)
               .IsUnique(false);
            builder.HasIndex(x => x.UpdatedBy)
               .IsUnique(false);

            builder.Property(x => x.IsDeleted)
                .HasDefaultValue(false);
            builder.Property(x => x.Name)
                .HasMaxLength(250);
            builder.Property(x => x.Data)
                .HasMaxLength(500);
            builder.Property(x => x.ContactDataTypeId)
                .HasDefaultValue(1);
            builder.Property(x => x.ContactTypeId)
                .HasDefaultValue(1);
            builder.Property(x => x.ContactEntityId)
                .HasDefaultValue(1);



            builder.HasOne(x => x.CreatedByUser)
               .WithOne(y => y.CreatedByContactDetails)
               .HasForeignKey<ContactDetails>(z => z.CreatedBy)
               .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.UpdateByUser)
               .WithOne(y => y.UpdatedByContactDetails)
               .HasForeignKey<ContactDetails>(z => z.UpdatedBy)
               .OnDelete(DeleteBehavior.Restrict);
        }
    }
}