"""
Analyze which invoices from the CSV are missing from the database
Generates a report and SQL to import missing invoices
"""

import csv
from collections import defaultdict

def parse_number(value):
    """Parse South African number format"""
    if not value or value.strip() == '':
        return 0.0
    clean = value.replace('R', '').replace(' ', '').replace(',', '.')
    try:
        return float(clean)
    except:
        return 0.0

def parse_quantity(value):
    """Parse quantity which may have space as thousands separator"""
    if not value or value.strip() == '':
        return 0
    clean = value.replace(' ', '').replace(',', '.')
    try:
        return int(float(clean))
    except:
        return 0

def main():
    csv_file = r"c:\Users\IT Department\Desktop\NCD-API\DatabaseManagement\NDOH35 - SALES ANALYSIS INCEPTION TILL CURRENT.csv"
    
    # Read all rows from CSV and group by invoice
    invoices = defaultdict(lambda: {
        'customer_code': '',
        'customer_name': '',
        'date': '',
        'items': [],
        'total': 0.0
    })
    
    with open(csv_file, 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f, delimiter=';')
        for row in reader:
            inv_no = row.get('INV No', '').strip()
            if not inv_no or inv_no.startswith('CN'):  # Skip empty and credit notes
                continue
            
            qty = parse_quantity(row.get('QTYSOLD', '0'))
            if qty <= 0:
                continue
            
            invoices[inv_no]['customer_code'] = row.get('CUST NO', '').strip()
            invoices[inv_no]['customer_name'] = row.get('CUSTOMER NAME', '').strip()
            invoices[inv_no]['date'] = row.get('Date', '').strip()
            invoices[inv_no]['items'].append({
                'sku': row.get('ITEM', '').strip(),
                'desc': row.get('DESC', '').strip(),
                'qty': qty,
                'price': parse_number(row.get('UnitPrice', '0')),
                'total': parse_number(row.get('SALES AMNT incl', '0'))
            })
            invoices[inv_no]['total'] += parse_number(row.get('SALES AMNT incl', '0'))
    
    print(f"Total unique invoices in CSV: {len(invoices)}")
    print()
    
    # Group by customer
    by_customer = defaultdict(list)
    for inv_no, data in invoices.items():
        by_customer[data['customer_name']].append((inv_no, data))
    
    print("INVOICES BY CUSTOMER:")
    print("=" * 70)
    for customer in sorted(by_customer.keys(), key=lambda x: len(by_customer[x]), reverse=True):
        inv_list = by_customer[customer]
        total_value = sum(data['total'] for _, data in inv_list)
        print(f"{customer}: {len(inv_list)} invoices, R{total_value:,.2f}")
    
    print()
    print("=" * 70)
    print()
    
    # Group by month
    by_month = defaultdict(list)
    for inv_no, data in invoices.items():
        date_parts = data['date'].split('/')
        if len(date_parts) >= 2:
            month_key = f"{date_parts[0]}-{date_parts[1]}"
            by_month[month_key].append((inv_no, data))
    
    print("INVOICES BY MONTH:")
    print("=" * 70)
    for month in sorted(by_month.keys()):
        inv_list = by_month[month]
        total_value = sum(data['total'] for _, data in inv_list)
        print(f"{month}: {len(inv_list)} invoices, R{total_value:,.2f}")
    
    # Generate SQL to create missing Sale records
    output_file = r"c:\Users\IT Department\Desktop\NCD-API\DatabaseManagement\import-missing-sales.sql"
    
    sql_lines = []
    sql_lines.append("-- =============================================================================")
    sql_lines.append("-- Import Missing Sale Records from CSV")
    sql_lines.append("-- =============================================================================")
    sql_lines.append(f"-- Total invoices to potentially import: {len(invoices)}")
    sql_lines.append("-- This script will only create Sales that don't already exist")
    sql_lines.append("-- =============================================================================")
    sql_lines.append("")
    sql_lines.append("SET NOCOUNT ON;")
    sql_lines.append("")
    sql_lines.append("PRINT '════════════════════════════════════════════════════════════════';")
    sql_lines.append("PRINT '  Importing Missing Sale Records';")
    sql_lines.append("PRINT '════════════════════════════════════════════════════════════════';")
    sql_lines.append("")
    sql_lines.append("BEGIN TRY")
    sql_lines.append("    BEGIN TRANSACTION;")
    sql_lines.append("")
    sql_lines.append("    DECLARE @SalesBefore INT = (SELECT COUNT(*) FROM Sale WHERE IsDeleted = 0);")
    sql_lines.append("    PRINT 'Sales before: ' + CAST(@SalesBefore AS NVARCHAR(10));")
    sql_lines.append("")
    
    # Generate INSERT for each invoice that doesn't exist
    for inv_no, data in sorted(invoices.items(), key=lambda x: x[1]['date']):
        customer_name = data['customer_name'].replace("'", "''")
        date_parts = data['date'].split('/')
        if len(date_parts) == 3:
            sale_date = f"{date_parts[0]}-{date_parts[1]}-{date_parts[2]}"
        else:
            sale_date = data['date']
        
        sql_lines.append(f"    -- Invoice: {inv_no}")
        sql_lines.append(f"    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = '{inv_no}' AND IsDeleted = 0)")
        sql_lines.append("    BEGIN")
        sql_lines.append(f"        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)")
        sql_lines.append(f"        VALUES ('{inv_no}', '{customer_name}', '{sale_date}', 0);")
        sql_lines.append("    END")
        sql_lines.append("")
    
    sql_lines.append("    DECLARE @SalesAfter INT = (SELECT COUNT(*) FROM Sale WHERE IsDeleted = 0);")
    sql_lines.append("    PRINT 'Sales after: ' + CAST(@SalesAfter AS NVARCHAR(10));")
    sql_lines.append("    PRINT 'Sales added: ' + CAST((@SalesAfter - @SalesBefore) AS NVARCHAR(10));")
    sql_lines.append("")
    sql_lines.append("    COMMIT TRANSACTION;")
    sql_lines.append("    PRINT '';")
    sql_lines.append("    PRINT '✅ Import Complete';")
    sql_lines.append("")
    sql_lines.append("END TRY")
    sql_lines.append("BEGIN CATCH")
    sql_lines.append("    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;")
    sql_lines.append("    PRINT '❌ ERROR: ' + ERROR_MESSAGE();")
    sql_lines.append("    THROW;")
    sql_lines.append("END CATCH;")
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))
    
    print()
    print(f"Generated: {output_file}")
    print("Run this SQL first to create missing Sale records, then re-run add-all-missing-saleitems.sql")

if __name__ == "__main__":
    main()
