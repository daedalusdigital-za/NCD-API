using MH.Domain.DBModel;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace MH.Infrastructure.Configuration
{
    public class ContactTypeConfiguration : IEntityTypeConfiguration<ContactType>
    {
        public void Configure(EntityTypeBuilder<ContactType> builder)
        {
            builder.Property(x => x.Id)
               .IsRequired()
               .ValueGeneratedNever();
            builder.Property(x => x.Name)
                .IsRequired()
                .HasMaxLength(250);
        }
    }
}