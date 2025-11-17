using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class SaleItemConfiguration : IEntityTypeConfiguration<SaleItem>
    {
        public void Configure(EntityTypeBuilder<SaleItem> builder)
        {
            builder.ToTable("SaleItem");
            
            builder.HasKey(t => t.Id);
            
            // Map ONLY the columns that exist in SaleItem table
            builder.Property(t => t.Id).HasColumnName("Id");
            builder.Property(t => t.SaleId).HasColumnName("SaleId").IsRequired();
            builder.Property(t => t.InventoryItemId).HasColumnName("InventoryItemId").IsRequired();
            builder.Property(t => t.Quantity).HasColumnName("Quantity").IsRequired();
            builder.Property(t => t.UnitPrice).HasColumnName("UnitPrice").IsRequired();
            builder.Property(t => t.TotalPrice).HasColumnName("TotalPrice").IsRequired();
            builder.Property(t => t.IsDeleted).HasColumnName("IsDeleted").IsRequired();
            
            // Relationships
            builder.HasOne(si => si.Sale)
                   .WithMany(s => s.SaleItems)
                   .HasForeignKey(si => si.SaleId)
                   .OnDelete(DeleteBehavior.Cascade);
            
            builder.HasOne(si => si.InventoryItem)
                   .WithMany()
                   .HasForeignKey(si => si.InventoryItemId)
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
