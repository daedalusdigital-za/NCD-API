"""
Generate SQL INSERT statements for missing SaleItems
Reads from CSV and creates SQL to add line items for existing invoices
"""

import csv
import re
from collections import defaultdict

def parse_number(value):
    """Parse South African number format (space for thousands, comma for decimal)"""
    if not value or value.strip() == '':
        return 0.0
    # Remove R prefix, spaces, and convert comma to dot
    clean = value.replace('R', '').replace(' ', '').replace(',', '.')
    try:
        return float(clean)
    except:
        return 0.0

def parse_quantity(value):
    """Parse quantity which may have space as thousands separator"""
    if not value or value.strip() == '':
        return 0
    # Remove spaces and commas used as decimal
    clean = value.replace(' ', '').replace(',', '.')
    try:
        return int(float(clean))
    except:
        return 0

def main():
    csv_file = r"c:\Users\IT Department\Desktop\NCD-API\DatabaseManagement\NDOH35 - SALES ANALYSIS INCEPTION TILL CURRENT.csv"
    output_file = r"c:\Users\IT Department\Desktop\NCD-API\DatabaseManagement\add-all-missing-saleitems.sql"
    
    # Read all rows from CSV
    rows = []
    with open(csv_file, 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f, delimiter=';')
        for row in reader:
            # Skip empty rows
            if not row.get('INV No') or not row.get('ITEM'):
                continue
            # Skip credit notes (negative quantities or CN prefix)
            inv_no = row.get('INV No', '').strip()
            if inv_no.startswith('CN'):
                continue
            qty = parse_quantity(row.get('QTYSOLD', '0'))
            if qty <= 0:
                continue
                
            rows.append({
                'CustomerCode': row.get('CUST NO', '').strip(),
                'CustomerName': row.get('CUSTOMER NAME', '').strip(),
                'ItemSKU': row.get('ITEM', '').strip(),
                'ItemDescription': row.get('DESC', '').strip(),
                'Province': row.get('REG', '').strip(),
                'InvoiceNumber': inv_no,
                'SaleDate': row.get('Date', '').strip(),
                'Location': row.get('LOCATION', '').strip(),
                'QuantitySold': qty,
                'UnitPrice': parse_number(row.get('UnitPrice', '0')),
                'TotalAmount': parse_number(row.get('SALES AMNT incl', '0'))
            })
    
    print(f"Total valid rows from CSV: {len(rows)}")
    
    # Generate SQL
    sql_lines = []
    sql_lines.append("-- =============================================================================")
    sql_lines.append("-- Add ALL Missing SaleItems from Sales Analysis Spreadsheet")
    sql_lines.append("-- =============================================================================")
    sql_lines.append(f"-- Total rows in CSV: {len(rows)}")
    sql_lines.append("-- This script will only add items for invoices that exist in Sale table")
    sql_lines.append("-- but don't have the corresponding line items in SaleItem table")
    sql_lines.append("-- =============================================================================")
    sql_lines.append("")
    sql_lines.append("SET NOCOUNT ON;")
    sql_lines.append("")
    sql_lines.append("PRINT '════════════════════════════════════════════════════════════════';")
    sql_lines.append("PRINT '  Adding ALL Missing Sale Line Items from Spreadsheet';")
    sql_lines.append("PRINT '════════════════════════════════════════════════════════════════';")
    sql_lines.append("PRINT '';")
    sql_lines.append("")
    sql_lines.append("BEGIN TRY")
    sql_lines.append("    BEGIN TRANSACTION;")
    sql_lines.append("")
    sql_lines.append("    -- Safety cleanup from any previous failed run")
    sql_lines.append("    IF OBJECT_ID('tempdb..#RawSalesData') IS NOT NULL DROP TABLE #RawSalesData;")
    sql_lines.append("")
    sql_lines.append("    CREATE TABLE #RawSalesData (")
    sql_lines.append("        CustomerCode NVARCHAR(50),")
    sql_lines.append("        CustomerName NVARCHAR(200),")
    sql_lines.append("        ItemSKU NVARCHAR(50),")
    sql_lines.append("        ItemDescription NVARCHAR(500),")
    sql_lines.append("        Province NVARCHAR(50),")
    sql_lines.append("        InvoiceNumber NVARCHAR(50),")
    sql_lines.append("        SaleDate DATE,")
    sql_lines.append("        Location NVARCHAR(200),")
    sql_lines.append("        QuantitySold INT,")
    sql_lines.append("        UnitPrice DECIMAL(18,2),")
    sql_lines.append("        TotalAmount DECIMAL(18,2)")
    sql_lines.append("    );")
    sql_lines.append("")
    sql_lines.append("    PRINT 'Step 1: Loading sales data...';")
    sql_lines.append("    ")
    
    # Generate VALUES for each row - batch into groups of 900 (under 1000 limit)
    BATCH_SIZE = 900
    value_lines = []
    for row in rows:
        # Escape single quotes in strings
        customer_name = row['CustomerName'].replace("'", "''")
        item_desc = row['ItemDescription'].replace("'", "''")
        
        # Convert date format from 2025/04/11 to 2025-04-11
        date_parts = row['SaleDate'].split('/')
        if len(date_parts) == 3:
            sale_date = f"{date_parts[0]}-{date_parts[1]}-{date_parts[2]}"
        else:
            sale_date = row['SaleDate']
        
        value_lines.append(
            f"    ('{row['CustomerCode']}', '{customer_name}', '{row['ItemSKU']}', '{item_desc}', "
            f"'{row['Province']}', '{row['InvoiceNumber']}', '{sale_date}', '{row['Location']}', "
            f"{row['QuantitySold']}, {row['UnitPrice']:.2f}, {row['TotalAmount']:.2f})"
        )
    
    # Split into batches of 900 rows each
    for i in range(0, len(value_lines), BATCH_SIZE):
        batch = value_lines[i:i + BATCH_SIZE]
        batch_num = (i // BATCH_SIZE) + 1
        sql_lines.append(f"    -- Batch {batch_num}")
        sql_lines.append("    INSERT INTO #RawSalesData (CustomerCode, CustomerName, ItemSKU, ItemDescription, Province, InvoiceNumber, SaleDate, Location, QuantitySold, UnitPrice, TotalAmount)")
        sql_lines.append("    VALUES")
        sql_lines.append(',\n'.join(batch) + ";")
        sql_lines.append("")
    
    sql_lines.append("")
    sql_lines.append("    DECLARE @TotalRows INT = (SELECT COUNT(*) FROM #RawSalesData);")
    sql_lines.append("    PRINT '  ✓ Loaded ' + CAST(@TotalRows AS NVARCHAR(10)) + ' rows of sales data';")
    sql_lines.append("    PRINT '';")
    sql_lines.append("")
    sql_lines.append("    DECLARE @ExistingItemsCount INT = (SELECT COUNT(*) FROM SaleItem WHERE IsDeleted = 0);")
    sql_lines.append("    PRINT 'Current SaleItems count: ' + CAST(@ExistingItemsCount AS NVARCHAR(10));")
    sql_lines.append("    PRINT '';")
    sql_lines.append("")
    sql_lines.append("    -- Count invoices that exist vs don't exist")
    sql_lines.append("    DECLARE @InvoicesFound INT = (")
    sql_lines.append("        SELECT COUNT(DISTINCT r.InvoiceNumber)")
    sql_lines.append("        FROM #RawSalesData r")
    sql_lines.append("        INNER JOIN Sale s ON r.InvoiceNumber = s.SaleNumber AND s.IsDeleted = 0")
    sql_lines.append("    );")
    sql_lines.append("    DECLARE @InvoicesNotFound INT = (")
    sql_lines.append("        SELECT COUNT(DISTINCT r.InvoiceNumber)")
    sql_lines.append("        FROM #RawSalesData r")
    sql_lines.append("        LEFT JOIN Sale s ON r.InvoiceNumber = s.SaleNumber AND s.IsDeleted = 0")
    sql_lines.append("        WHERE s.Id IS NULL")
    sql_lines.append("    );")
    sql_lines.append("    PRINT 'Invoices found in Sale table: ' + CAST(@InvoicesFound AS NVARCHAR(10));")
    sql_lines.append("    PRINT 'Invoices NOT found (will be skipped): ' + CAST(@InvoicesNotFound AS NVARCHAR(10));")
    sql_lines.append("    PRINT '';")
    sql_lines.append("")
    sql_lines.append("    PRINT 'Step 2: Adding missing line items to existing invoices...';")
    sql_lines.append("    ")
    sql_lines.append("    INSERT INTO SaleItem (SaleId, InventoryItemId, Quantity, UnitPrice, TotalPrice, IsDeleted)")
    sql_lines.append("    SELECT s.Id, inv.Id, r.QuantitySold, r.UnitPrice, r.TotalAmount, 0")
    sql_lines.append("    FROM #RawSalesData r")
    sql_lines.append("    INNER JOIN Sale s ON r.InvoiceNumber = s.SaleNumber")
    sql_lines.append("    INNER JOIN InventoryItem inv ON r.ItemSKU = inv.SKU")
    sql_lines.append("    WHERE s.IsDeleted = 0 AND inv.IsDeleted = 0")
    sql_lines.append("    AND NOT EXISTS (")
    sql_lines.append("        SELECT 1 FROM SaleItem si")
    sql_lines.append("        WHERE si.SaleId = s.Id AND si.InventoryItemId = inv.Id")
    sql_lines.append("        AND si.Quantity = r.QuantitySold AND si.UnitPrice = r.UnitPrice AND si.IsDeleted = 0")
    sql_lines.append("    );")
    sql_lines.append("")
    sql_lines.append("    DECLARE @ItemsAdded INT = @@ROWCOUNT;")
    sql_lines.append("    PRINT '  ✓ Added ' + CAST(@ItemsAdded AS NVARCHAR(10)) + ' new sale line items';")
    sql_lines.append("    PRINT '';")
    sql_lines.append("")
    sql_lines.append("    DECLARE @NewItemsCount INT = (SELECT COUNT(*) FROM SaleItem WHERE IsDeleted = 0);")
    sql_lines.append("    PRINT 'New SaleItems count: ' + CAST(@NewItemsCount AS NVARCHAR(10));")
    sql_lines.append("    PRINT 'Items added: ' + CAST((@NewItemsCount - @ExistingItemsCount) AS NVARCHAR(10));")
    sql_lines.append("")
    sql_lines.append("    COMMIT TRANSACTION;")
    sql_lines.append("    ")
    sql_lines.append("    PRINT '';")
    sql_lines.append("    PRINT '════════════════════════════════════════════════════════════════';")
    sql_lines.append("    PRINT '  ✅ Import Complete';")
    sql_lines.append("    PRINT '════════════════════════════════════════════════════════════════';")
    sql_lines.append("")
    sql_lines.append("    DROP TABLE #RawSalesData;")
    sql_lines.append("")
    sql_lines.append("END TRY")
    sql_lines.append("BEGIN CATCH")
    sql_lines.append("    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;")
    sql_lines.append("    PRINT '❌ ERROR: ' + ERROR_MESSAGE();")
    sql_lines.append("    IF OBJECT_ID('tempdb..#RawSalesData') IS NOT NULL DROP TABLE #RawSalesData;")
    sql_lines.append("    THROW;")
    sql_lines.append("END CATCH;")
    
    # Write output
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))
    
    print(f"SQL file generated: {output_file}")
    print(f"Total INSERT VALUES: {len(rows)}")

if __name__ == "__main__":
    main()
