using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class TrainerConfiguration : IEntityTypeConfiguration<Trainer>
    {
        public void Configure(EntityTypeBuilder<Trainer> builder)
        {
            builder.ToTable("Trainers");

            builder.HasKey(t => t.Id);

            // Map BaseModel properties to existing database column names
            builder.Property(t => t.DateCreated)
                .HasColumnName("CreatedAt")
                .IsRequired();

            builder.Property(t => t.LastUpdated)
                .HasColumnName("UpdatedAt");

            // CreatedBy and UpdatedBy columns need to be added to database
            // Run: DatabaseManagement/add-trainer-audit-columns.sql
            builder.Property(t => t.CreatedBy)
                .IsRequired()
                .HasDefaultValue(0);
            
            builder.Property(t => t.UpdatedBy)
                .IsRequired(false);

            // Map entity properties
            builder.Property(t => t.Name)
                .HasMaxLength(255);

            builder.Property(t => t.Email)
                .HasMaxLength(255);

            builder.Property(t => t.Phone)
                .HasMaxLength(50);

            builder.Property(t => t.Location)
                .HasMaxLength(255);

            builder.Property(t => t.Qualification)
                .HasMaxLength(500);

            builder.Property(t => t.Experience)
                .HasMaxLength(500);

            builder.Property(t => t.Bio);

            builder.Property(t => t.Status)
                .IsRequired();

            builder.Property(t => t.ProvinceId);
        }
    }
}
