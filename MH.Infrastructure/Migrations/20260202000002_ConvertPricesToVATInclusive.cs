using Microsoft.EntityFrameworkCore.Migrations;

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class ConvertPricesToVATInclusive : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // This migration converts all prices from VAT Exclusive to VAT Inclusive (15% South Africa)
            // Formula: VAT Inclusive = VAT Exclusive × 1.15
            
            migrationBuilder.Sql(@"
                BEGIN TRANSACTION;
                
                BEGIN TRY
                    PRINT 'Converting InventoryItem prices to VAT Inclusive (15%)...';
                    
                    UPDATE InventoryItem
                    SET UnitPrice = ROUND(UnitPrice * 1.15, 2)
                    WHERE UnitPrice > 0;
                    
                    PRINT 'Converting SaleItem prices to VAT Inclusive (15%)...';
                    
                    UPDATE SaleItem
                    SET 
                        UnitPrice = ROUND(UnitPrice * 1.15, 2),
                        TotalPrice = ROUND(TotalPrice * 1.15, 2)
                    WHERE UnitPrice > 0 OR TotalPrice > 0;
                    
                    PRINT 'VAT conversion completed successfully.';
                    
                    COMMIT TRANSACTION;
                END TRY
                BEGIN CATCH
                    ROLLBACK TRANSACTION;
                    THROW;
                END CATCH
            ");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            // This migration cannot be safely reversed without backup data
            // Manual intervention required using backup tables if rollback is needed
            
            migrationBuilder.Sql(@"
                PRINT 'WARNING: This migration cannot be automatically reversed.';
                PRINT 'If you need to rollback, use the backup tables:';
                PRINT '  - InventoryItem_PriceBackup';
                PRINT '  - SaleItem_PriceBackup';
                PRINT 'And manually restore prices using the backup data.';
            ");
        }
    }
}
