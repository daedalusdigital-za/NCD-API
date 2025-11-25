using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class InventoryItemConfiguration : IEntityTypeConfiguration<InventoryItem>
    {
        public void Configure(EntityTypeBuilder<InventoryItem> builder)
        {
            builder.ToTable("InventoryItem");
            builder.HasKey(x => x.Id);
            
            // Configure properties to match database schema
            builder.Property(x => x.Name).IsRequired().HasMaxLength(200);
            builder.Property(x => x.Description).HasMaxLength(1000);
            builder.Property(x => x.SKU).IsRequired().HasMaxLength(50);
            builder.Property(x => x.UnitOfMeasure).IsRequired().HasMaxLength(50);
            builder.Property(x => x.UnitPrice).HasPrecision(18, 2);
            builder.Property(x => x.Supplier).HasMaxLength(200);
            builder.Property(x => x.BatchNumber).HasMaxLength(100);
            
            // Map the new properties to existing database columns
            builder.Property(x => x.CreatedDate).HasColumnName("CreatedDate");
            builder.Property(x => x.CreatedBy).HasColumnName("CreatedBy");
            builder.Property(x => x.LastUpdated).HasColumnName("LastUpdated");
            builder.Property(x => x.UpdatedBy).HasColumnName("UpdatedBy");
            
            // Ignore base model properties that don't exist in the database
            builder.Ignore("DateCreated");
            
            // Explicitly configure the SaleItems relationship
            builder.HasMany(ii => ii.SaleItems)
                   .WithOne(si => si.InventoryItem)
                   .HasForeignKey(si => si.InventoryItemId)
                   .HasConstraintName("FK_SaleItem_InventoryItems_InventoryItemId")
                   .OnDelete(DeleteBehavior.Restrict);
            
            // Configure user relationships
            builder.HasOne(x => x.CreatedByUser)
                   .WithMany()
                   .HasForeignKey(x => x.CreatedBy)
                   .OnDelete(DeleteBehavior.SetNull);
                   
            builder.HasOne(x => x.UpdateByUser)
                   .WithMany()
                   .HasForeignKey(x => x.UpdatedBy)
                   .OnDelete(DeleteBehavior.SetNull);
        }
    }
}
