using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MH.Domain.DBModel;

namespace MH.Infrastructure.Configuration
{
    public class CreditNoteConfiguration : IEntityTypeConfiguration<CreditNote>
    {
        public void Configure(EntityTypeBuilder<CreditNote> builder)
        {
            // Explicitly map to CreditNotes table
            builder.ToTable("CreditNotes");
            
            // Primary key
            builder.HasKey(x => x.Id);
            
            // Configure Invoice navigation with explicit FK mapping
            builder.HasOne(x => x.Invoice)
                .WithMany(s => s.CreditNotes)
                .HasForeignKey(x => x.InvoiceId)
                .IsRequired(false);  // Make FK optional since InvoiceId might be null for manual entries
        }
    }
}
