using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class IssueConfiguration : IEntityTypeConfiguration<Issue>
    {
        public void Configure(EntityTypeBuilder<Issue> builder)
        {

            builder.Property(x => x.IsDeleted)
                .HasDefaultValue(false);
            builder.Property(x => x.Name)
                .HasMaxLength(250);
        }
    }
}