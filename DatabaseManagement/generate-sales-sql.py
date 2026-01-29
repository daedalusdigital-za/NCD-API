"""
Sales Data Import Generator
Converts spreadsheet sales data into SQL INSERT statements
"""

import re
from datetime import datetime
from decimal import Decimal

# Your sales data goes here (paste from Excel/CSV)
sales_data_text = """
04-BLO-001	BLOEMFONTEIN MEDICAL DEPOT	NDOH35004	GLUCOSE METER- BIO HERMES	04	IN152428	2025/04/11	000	500,00	R136,53	R68 265,22
04-BLO-001	BLOEMFONTEIN MEDICAL DEPOT	NDOH35017	GLUCOSE TEST STRIPS	04	IN152427	2025/04/11	000	2 400,00	R44,84	R107 624,35
01-RKK-001	RK KHAN HOSPITAL	NDOH35017	GLUCOSE TEST STRIPS	01	IN152563	2025/04/17	000	1 400,00	R44,84	R62 780,87
"""
# ... Add all your rows here

def clean_number(value):
    """Remove R, spaces, commas from numbers"""
    if not value:
        return '0.00'
    cleaned = value.replace('R', '').replace(' ', '').replace(',', '')
    return cleaned if cleaned else '0.00'

def parse_date(date_str):
    """Convert date string to SQL format"""
    try:
        dt = datetime.strptime(date_str, '%Y/%m/%d')
        return dt.strftime('%Y-%m-%d')
    except:
        return date_str

def generate_sql_insert(sales_data_text):
    """Generate SQL INSERT statements from tab-delimited data"""
    
    lines = [line.strip() for line in sales_data_text.strip().split('\n') if line.strip()]
    
    sql_statements = []
    
    for line in lines:
        parts = line.split('\t')
        if len(parts) < 11:
            continue
            
        cust_code = parts[0].strip()
        cust_name = parts[1].strip().replace("'", "''")  # Escape single quotes
        item_sku = parts[2].strip()
        item_desc = parts[3].strip().replace("'", "''")
        province = parts[4].strip()
        invoice = parts[5].strip()
        sale_date = parse_date(parts[6].strip())
        location = parts[7].strip()
        qty = clean_number(parts[8])
        unit_price = clean_number(parts[9])
        total_amt = clean_number(parts[10])
        
        sql = f"('{cust_code}', '{cust_name}', '{item_sku}', '{item_desc}', '{province}', '{invoice}', '{sale_date}', '{location}', {qty}, {unit_price}, {total_amt})"
        sql_statements.append(sql)
    
    return sql_statements

# Generate the SQL
sql_values = generate_sql_insert(sales_data_text)

print("-- Generated SQL INSERT VALUES")
print("-- Copy these into the import-sales-records-2025.sql file")
print("")
print("INSERT INTO #RawSalesData (CustomerCode, CustomerName, ItemSKU, ItemDescription, Province, InvoiceNumber, SaleDate, Location, QuantitySold, UnitPrice, TotalAmount)")
print("VALUES")

for i, value in enumerate(sql_values):
    if i < len(sql_values) - 1:
        print(f"    {value},")
    else:
        print(f"    {value};")

print("")
print(f"-- Total rows: {len(sql_values)}")
