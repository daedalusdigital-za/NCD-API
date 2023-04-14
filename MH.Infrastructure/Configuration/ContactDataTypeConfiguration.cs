using MH.Domain.DBModel;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MH.Infrastructure.Configuration
{
    public class ContactDataTypeConfiguration : IEntityTypeConfiguration<ContactDataType>
    {
        public void Configure(EntityTypeBuilder<ContactDataType> builder)
        {
            builder.Property(x => x.Id)
               .IsRequired()
               .ValueGeneratedNever();
            builder.Property(x => x.Name)
                .IsRequired()
                .HasMaxLength(250);
        }
    }
}