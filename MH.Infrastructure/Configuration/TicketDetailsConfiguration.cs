using MH.Domain.DBModel;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace MH.Infrastructure.Configuration
{
    public class TicketDetailsConfiguration : IEntityTypeConfiguration<TicketDetails>
    {
        public void Configure(EntityTypeBuilder<TicketDetails> builder)
        {
            //builder.HasIndex(x => x.ContactDataTypeId)
            //    .IsUnique(false);
            //builder.HasIndex(x => x.ContactTypeId)
            //    .IsUnique(false);
            //builder.HasIndex(x => x.ContactEntityId)
            //    .IsUnique(false);
            builder.HasIndex(x => x.CreatedBy)
                .IsUnique(false);
            builder.HasIndex(x => x.UpdatedBy)
                .IsUnique(false);

            builder.Property(x => x.IsDeleted)
                .HasDefaultValue(false);
            builder.Property(x => x.Subject)
                .HasMaxLength(250);
            builder.Property(x => x.Description)
                .HasMaxLength(500);


            builder.HasOne(x => x.CreatedByUser)
                .WithOne(y => y.CreatedByTicketDetails)
                .HasForeignKey<TicketDetails>(z => z.CreatedBy)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.UpdateByUser)
                .WithOne(y => y.UpdatedByTicketDetails)
                .HasForeignKey<TicketDetails>(z => z.UpdatedBy)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}