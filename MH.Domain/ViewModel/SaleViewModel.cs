using MH.Domain.DBModel;

namespace MH.Domain.ViewModel
{
    public class SaleViewModel
    {
        public int? Id { get; set; }
        public string SaleNumber { get; set; } = null!;
        public DateTime SaleDate { get; set; }
        public string CustomerName { get; set; } = null!;
        public string? CustomerPhone { get; set; }
        public decimal Total { get; set; }
        public string? Notes { get; set; }
        public List<SaleItemViewModel>? SaleItems { get; set; }
        public DateTime DateCreated { get; set; }
        
        // Credit Note tracking
        public bool HasCreditNote { get; set; }
        public decimal? CreditedAmount { get; set; }
        public List<CreditNoteSummaryViewModel>? CreditNotes { get; set; }
    }

    public class SaleItemViewModel
    {
        public int? Id { get; set; }
        public int SaleId { get; set; }
        public int InventoryItemId { get; set; }
        public string? InventoryItemName { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }  // VAT INCLUSIVE (15%)
        public decimal TotalPrice { get; set; } // VAT INCLUSIVE (15%)
        
        // VAT Breakdown - For display/reference only
        public decimal UnitPriceExcludingVAT => Math.Round(UnitPrice / 1.15m, 2);
        public decimal UnitVATAmount => Math.Round(UnitPrice - UnitPriceExcludingVAT, 2);
        public decimal TotalVATAmount => Math.Round(TotalPrice - (TotalPrice / 1.15m), 2);
        public decimal VATRate => 0.15m; // 15% South Africa
    }
}