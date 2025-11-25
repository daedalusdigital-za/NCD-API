using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class TrainerConfiguration : IEntityTypeConfiguration<Trainer>
    {
        public void Configure(EntityTypeBuilder<Trainer> builder)
        {
            builder.ToTable("Trainer");
            builder.HasKey(x => x.Id);
            
            // Configure properties to match actual database schema
            builder.Property(x => x.FirstName);
            builder.Property(x => x.LastName);
            builder.Property(x => x.Email);
            builder.Property(x => x.Phone);
            builder.Property(x => x.Specialization);
            builder.Property(x => x.Experience);
            builder.Property(x => x.Certification);
            builder.Property(x => x.IsActive);
            builder.Property(x => x.IsDeleted);
            builder.Property(x => x.ProvinceId);
            builder.Property(x => x.LastUpdated);
            builder.Property(x => x.UpdatedBy);
            builder.Property(x => x.ModifiedBy);
            
            // Base model properties
            builder.Property(x => x.DateCreated).HasColumnName("CreatedDate");
            builder.Property(x => x.CreatedBy).HasColumnName("CreatedBy");
        }
    }
}

