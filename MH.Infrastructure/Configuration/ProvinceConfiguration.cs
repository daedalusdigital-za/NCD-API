using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class ProvinceConfiguration : IEntityTypeConfiguration<Province>
    {
        public void Configure(EntityTypeBuilder<Province> builder)
        {
            builder.ToTable("Province"); // Use singular to match actual database table
            
            // Province table uses different column names than the standard BaseModel mapping
            // Override the base mapping for Province specifically
            builder.Property(e => e.DateCreated)
                .HasColumnName("CreatedDate");   // Province uses CreatedDate not CreatedAt

            builder.Property(e => e.LastUpdated)
                .HasColumnName("LastUpdated");   // Province uses LastUpdated not UpdatedAt
            
            // Province table in database doesn't have these columns, so ignore them
            builder.Ignore(p => p.Population);         // Not in database table
            builder.Ignore(p => p.HealthFacilities);   // Not in database table
            
            // Province table doesn't have user navigation properties mapped properly
            builder.Ignore(p => p.CreatedByUser);      // No proper foreign key setup
            builder.Ignore(p => p.UpdateByUser);       // No proper foreign key setup
        }
    }
}
