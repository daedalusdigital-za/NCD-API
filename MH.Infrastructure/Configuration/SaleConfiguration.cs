using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class SaleConfiguration : IEntityTypeConfiguration<Sale>
    {
        public void Configure(EntityTypeBuilder<Sale> builder)
        {
            builder.ToTable("Sales");
            
            // Explicitly ignore any user navigation properties that EF might try to infer
            builder.Ignore("CreatedByUser");
            builder.Ignore("UpdatedByUser");
            
            // Key
            builder.HasKey(t => t.Id);
            
            // Required properties
            builder.Property(t => t.SaleNumber).IsRequired();
            builder.Property(t => t.SaleDate).IsRequired();
            builder.Property(t => t.CustomerName).IsRequired();
            builder.Property(t => t.IsDeleted).IsRequired();
            
            // BaseModel audit properties - map to exact database column names
            // CRITICAL: Tell EF Core these are plain int columns, NOT foreign keys
            builder.Property(t => t.DateCreated)
                   .HasColumnName("CreatedDate")
                   .HasColumnType("datetime2")
                   .IsRequired();
            
            builder.Property(t => t.LastUpdated)
                   .HasColumnName("LastUpdated")
                   .HasColumnType("datetime2");
            
            builder.Property(t => t.CreatedBy)
                   .HasColumnName("CreatedBy")
                   .HasColumnType("int")
                   .ValueGeneratedNever()  // This is NOT an auto-generated FK
                   .IsRequired();
            
            builder.Property(t => t.UpdatedBy)
                   .HasColumnName("UpdatedBy")
                   .HasColumnType("int")
                   .ValueGeneratedNever();  // This is NOT an auto-generated FK
            
            // Province relationship
            builder.HasOne(s => s.Province)
                   .WithMany()
                   .HasForeignKey(s => s.ProvinceId)
                   .OnDelete(DeleteBehavior.Restrict)
                   .IsRequired(false);
                   
            // SaleItems relationship
            builder.HasMany(s => s.SaleItems)
                   .WithOne(si => si.Sale)
                   .HasForeignKey(si => si.SaleId)
                   .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
