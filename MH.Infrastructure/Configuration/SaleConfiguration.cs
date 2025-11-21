using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class SaleConfiguration : IEntityTypeConfiguration<Sale>
    {
        public void Configure(EntityTypeBuilder<Sale> builder)
        {
            builder.ToTable("Sale");  // Table name is "Sale" not "Sales"
            
            // Explicitly ignore any user navigation properties that EF might try to infer
            builder.Ignore("CreatedByUser");
            builder.Ignore("UpdatedByUser");
            
            // Sale table doesn't have these BaseModel columns - ignore them
            builder.Ignore(t => t.LastUpdated);
            builder.Ignore(t => t.UpdatedBy);
            
            // Key
            builder.HasKey(t => t.Id);
            
            // Required properties
            builder.Property(t => t.SaleNumber).IsRequired();
            builder.Property(t => t.SaleDate).IsRequired();
            builder.Property(t => t.CustomerName).IsRequired();
            builder.Property(t => t.IsDeleted).IsRequired();
            
            // BaseModel audit properties - map to exact database column names
            builder.Property(t => t.DateCreated)
                   .HasColumnName("CreatedDate")
                   .HasColumnType("datetime2")
                   .IsRequired();
            
            builder.Property(t => t.CreatedBy)
                   .HasColumnName("CreatedBy")
                   .HasColumnType("int")
                   .ValueGeneratedNever()  // This is NOT an auto-generated FK
                   .IsRequired();
                   
            // SaleItems relationship
            builder.HasMany(s => s.SaleItems)
                   .WithOne(si => si.Sale)
                   .HasForeignKey(si => si.SaleId)
                   .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
