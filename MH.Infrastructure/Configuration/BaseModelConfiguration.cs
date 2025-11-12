using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.Model;

namespace MH.Infrastructure.Configuration
{
    /// <summary>
    /// Base configuration for all entities inheriting from BaseModel
    /// Maps C# property names to database column names
    /// </summary>
    public static class BaseModelConfiguration
    {
        public static void ConfigureBaseModel<TEntity, TId>(this EntityTypeBuilder<TEntity> builder) 
            where TEntity : BaseModel<TId>
        {
            // Map BaseModel audit properties to database column naming convention
            builder.Property(e => e.DateCreated)
                .HasColumnName("CreatedAt");

            builder.Property(e => e.LastUpdated)
                .HasColumnName("UpdatedAt");

            // CreatedBy and UpdatedBy use the same column names in database
            // No mapping needed for these
        }
    }
}
