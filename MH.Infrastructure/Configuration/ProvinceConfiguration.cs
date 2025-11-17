using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class ProvinceConfiguration : IEntityTypeConfiguration<Province>
    {
        public void Configure(EntityTypeBuilder<Province> builder)
        {
            builder.ToTable("Provinces");
            
            // Province table only has timestamp audit columns, not user ID audit columns
            // So we ignore the properties that don't exist in the database
            builder.Ignore(p => p.CreatedBy);         // Province table doesn't have this column
            builder.Ignore(p => p.UpdatedBy);          // Province table doesn't have this column
            builder.Ignore(p => p.IsDeleted);          // Province table doesn't have this column
            builder.Ignore(p => p.CreatedByUser);      // No navigation property either
            builder.Ignore(p => p.UpdateByUser);       // No navigation property either
            
            // Map only the timestamp properties that DO exist
            builder.Property(p => p.DateCreated)
                   .HasColumnName("CreatedAt")
                   .IsRequired();
            
            builder.Property(p => p.LastUpdated)
                   .HasColumnName("UpdatedAt");
            
            // Fix type mismatch: Population is long? in entity but int in database
            builder.Property(p => p.Population)
                   .HasColumnType("int");
                   
            builder.Property(p => p.HealthFacilities)
                   .HasColumnType("int");
        }
    }
}
