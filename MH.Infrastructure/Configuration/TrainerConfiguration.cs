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

            // Map BaseModel audit columns to database column names
            builder.Property(t => t.DateCreated).HasColumnName("CreatedAt");
            builder.Property(t => t.LastUpdated).HasColumnName("UpdatedAt");
        }
    }
}
