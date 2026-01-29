# Generate SQL with batched INSERTs (max 1000 rows per batch)
import sys
sys.path.insert(0, r'c:\Users\IT Department\Desktop\NCD-API\DatabaseManagement')

# Import SALES_DATA from convert-sales-to-sql.py
exec(open('convert-sales-to-sql.py', encoding='utf-8').read())
import re

def clean_number(num_str):
    """Convert South African number format to decimal"""
    if not num_str or num_str == '':
        return '0.00'
    num_str = num_str.strip()
    num_str = num_str.replace('R', '').strip()
    num_str = num_str.replace(' ', '')
    num_str = num_str.replace(',', '.')
    try:
        return f"{float(num_str):.2f}"
    except:
        return '0.00'

def parse_date(date_str):
    """Convert date format"""
    if '/' in date_str:
        return date_str.replace('/', '-')
    return date_str

def escape_sql(value):
    """Escape single quotes for SQL"""
    return value.replace("'", "''")

def generate_batched_inserts():
    lines = [line.strip() for line in SALES_DATA.strip().split('\n') if line.strip()]
    
    batch_size = 1000
    all_batches = []
    
    for batch_num, i in enumerate(range(0, len(lines), batch_size), 1):
        batch_lines = lines[i:i + batch_size]
        values_list = []
        
        for line in batch_lines:
            parts = line.split('\t')
            if len(parts) < 11:
                continue
            
            customer_code = escape_sql(parts[0].strip())
            customer_name = escape_sql(parts[1].strip())
            item_sku = escape_sql(parts[2].strip())
            item_desc = escape_sql(parts[3].strip())
            province = escape_sql(parts[4].strip())
            invoice_num = escape_sql(parts[5].strip())
            sale_date = parse_date(parts[6].strip())
            location = escape_sql(parts[7].strip())
            qty = clean_number(parts[8])
            unit_price = clean_number(parts[9])
            total = clean_number(parts[10])
            
            value_row = f"    ('{customer_code}', '{customer_name}', '{item_sku}', '{item_desc}', '{province}', '{invoice_num}', '{sale_date}', '{location}', {qty}, {unit_price}, {total})"
            values_list.append(value_row)
        
        batch_sql = "INSERT INTO #RawSalesData (CustomerCode, CustomerName, ItemSKU, ItemDescription, Province, InvoiceNumber, SaleDate, Location, QuantitySold, UnitPrice, TotalAmount)\nVALUES\n"
        batch_sql += ',\n'.join(values_list) + ';\n'
        all_batches.append(batch_sql)
    
    return '\n'.join(all_batches)

# Generate and save
output = generate_batched_inserts()
with open('sql-batched-inserts.txt', 'w', encoding='utf-8') as f:
    f.write(output)

print(f"Generated batched SQL inserts")
