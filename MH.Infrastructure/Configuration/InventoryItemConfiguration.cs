using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class InventoryItemConfiguration : IEntityTypeConfiguration<InventoryItem>
    {
        public void Configure(EntityTypeBuilder<InventoryItem> builder)
        {
            builder.ToTable("InventoryItems");
            builder.ConfigureBaseModel<InventoryItem, int>();
            
            // Explicitly configure the SaleItems relationship
            builder.HasMany(ii => ii.SaleItems)
                   .WithOne(si => si.InventoryItem)
                   .HasForeignKey(si => si.InventoryItemId)
                   .HasConstraintName("FK_SaleItem_InventoryItems_InventoryItemId")
                   .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
