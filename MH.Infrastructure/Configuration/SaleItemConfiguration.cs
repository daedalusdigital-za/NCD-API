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
            
            // Explicitly configure ONLY the properties that exist
            builder.Property(t => t.Id)
                   .HasColumnName("Id")
                   .IsRequired()
                   .ValueGeneratedOnAdd();
                   
            builder.Property(t => t.SaleId)
                   .HasColumnName("SaleId")
                   .IsRequired();
                   
            builder.Property(t => t.InventoryItemId)
                   .HasColumnName("InventoryItemId")
                   .IsRequired();
                   
            builder.Property(t => t.Quantity)
                   .HasColumnName("Quantity")
                   .IsRequired();
                   
            builder.Property(t => t.UnitPrice)
                   .HasColumnName("UnitPrice")
                   .HasColumnType("decimal(18,2)")
                   .IsRequired();
                   
            builder.Property(t => t.TotalPrice)
                   .HasColumnName("TotalPrice")
                   .HasColumnType("decimal(18,2)")
                   .IsRequired();
                   
            builder.Property(t => t.IsDeleted)
                   .HasColumnName("IsDeleted")
                   .HasDefaultValue(false)
                   .IsRequired();
            
            // Configure relationships with explicit foreign keys
            builder.HasOne(si => si.Sale)
                   .WithMany(s => s.SaleItems)
                   .HasForeignKey(si => si.SaleId)
                   .HasConstraintName("FK_SaleItem_Sale_SaleId")
                   .OnDelete(DeleteBehavior.Cascade);
            
            builder.HasOne(si => si.InventoryItem)
                   .WithMany(ii => ii.SaleItems)
                   .HasForeignKey(si => si.InventoryItemId)
                   .HasConstraintName("FK_SaleItem_InventoryItems_InventoryItemId")
                   .OnDelete(DeleteBehavior.Restrict);
                   
            // Create explicit indexes
            builder.HasIndex(si => si.SaleId)
                   .HasDatabaseName("IX_SaleItem_SaleId");
                   
            builder.HasIndex(si => si.InventoryItemId)
                   .HasDatabaseName("IX_SaleItem_InventoryItemId");
        }
    }
}
