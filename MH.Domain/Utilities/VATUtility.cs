namespace MH.Domain.Utilities
{
    /// <summary>
    /// VAT (Value Added Tax) utility class for South Africa
    /// Handles conversion between VAT exclusive and inclusive prices
    /// VAT Rate: 15%
    /// </summary>
    public static class VATUtility
    {
        public const decimal VAT_RATE = 0.15m; // 15% South Africa VAT
        public const decimal VAT_MULTIPLIER = 1.15m; // For converting exclusive to inclusive
        
        /// <summary>
        /// Convert a VAT exclusive price to VAT inclusive price
        /// Formula: Price × 1.15
        /// </summary>
        public static decimal ConvertToInclusive(decimal exclusivePrice)
        {
            return Math.Round(exclusivePrice * VAT_MULTIPLIER, 2);
        }
        
        /// <summary>
        /// Convert a VAT inclusive price to VAT exclusive price
        /// Formula: Price ÷ 1.15
        /// </summary>
        public static decimal ConvertToExclusive(decimal inclusivePrice)
        {
            return Math.Round(inclusivePrice / VAT_MULTIPLIER, 2);
        }
        
        /// <summary>
        /// Calculate the VAT amount from a VAT inclusive price
        /// Formula: Price - (Price ÷ 1.15)
        /// </summary>
        public static decimal CalculateVATAmount(decimal inclusivePrice)
        {
            var exclusive = ConvertToExclusive(inclusivePrice);
            return Math.Round(inclusivePrice - exclusive, 2);
        }
        
        /// <summary>
        /// Calculate the VAT amount from a VAT exclusive price
        /// Formula: Price × 0.15
        /// </summary>
        public static decimal CalculateVATAmountFromExclusive(decimal exclusivePrice)
        {
            return Math.Round(exclusivePrice * VAT_RATE, 2);
        }
        
        /// <summary>
        /// Get a detailed VAT breakdown for a price
        /// </summary>
        public static VATBreakdown GetVATBreakdown(decimal inclusivePrice)
        {
            var exclusive = ConvertToExclusive(inclusivePrice);
            var vat = CalculateVATAmount(inclusivePrice);
            
            return new VATBreakdown
            {
                PriceIncludingVAT = inclusivePrice,
                PriceExcludingVAT = exclusive,
                VATAmount = vat,
                VATRate = VAT_RATE,
                VATPercentage = VAT_RATE * 100
            };
        }
    }
    
    /// <summary>
    /// Detailed breakdown of a price with VAT information
    /// </summary>
    public class VATBreakdown
    {
        public decimal PriceIncludingVAT { get; set; }
        public decimal PriceExcludingVAT { get; set; }
        public decimal VATAmount { get; set; }
        public decimal VATRate { get; set; }
        public decimal VATPercentage { get; set; }
        
        public override string ToString()
        {
            return $"Price (excl VAT): R{PriceExcludingVAT:F2}, VAT (15%): R{VATAmount:F2}, Total (incl VAT): R{PriceIncludingVAT:F2}";
        }
    }
}
