using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class SaleConfiguration : IEntityTypeConfiguration<Sale>
    {
        public void Configure(EntityTypeBuilder<Sale> builder)
        {
            builder.ToTable("Sale");
            
            // Map BaseModel properties to database columns
            builder.Property(t => t.DateCreated).HasColumnName("CreatedDate").IsRequired();
            builder.Property(t => t.LastUpdated).HasColumnName("LastUpdated");
            builder.Property(t => t.CreatedBy).IsRequired().HasDefaultValue(0);
            builder.Property(t => t.UpdatedBy);
            
            // Relationships
            builder.HasMany(s => s.SaleItems)
                   .WithOne(si => si.Sale)
                   .HasForeignKey(si => si.SaleId);
        }
    }
}
