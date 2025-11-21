using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class TrainerConfiguration : IEntityTypeConfiguration<Trainer>
    {
        public void Configure(EntityTypeBuilder<Trainer> builder)
        {
            builder.ToTable("Trainer"); // Singular table name as per database
            
            // Apply base model configuration - database uses CreatedAt/UpdatedAt
            builder.ConfigureBaseModel<Trainer, int>();
        }
    }
}
