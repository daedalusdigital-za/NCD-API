#!/usr/bin/env python3
"""Generate ONLY the VALUES clause for SQL INSERT - no console output"""

# Import the data from the convert script
SALES_DATA = """
"""

# Read from convert-sales-to-sql.py
with open('convert-sales-to-sql.py', 'r', encoding='utf-8') as f:
    content = f.read()
    # Extract just the SALES_DATA part
    start = content.find('SALES_DATA = """') + len('SALES_DATA = """')
    end = content.find('"""', start)
    SALES_DATA = content[start:end]

def clean_number(value):
    """Remove currency symbols, spaces, commas from numbers
    Format: R68 265,22 -> 68265.22 (space = thousands, comma = decimal)
    """
    if not value or value.strip() in ['', '0', '0,00', 'R0,00']:
        return '0.00'
    # Remove R prefix
    cleaned = value.replace('R', '').strip()
    # Remove spaces (thousands separators)
    cleaned = cleaned.replace(' ', '')
    # Replace comma with period (decimal separator)
    cleaned = cleaned.replace(',', '.')
    try:
        return f"{float(cleaned):.2f}"
    except:
        return '0.00'

def parse_date(date_str):
    """Convert YYYY/MM/DD to YYYY-MM-DD"""
    return date_str.strip().replace('/', '-')

def escape_sql(text):
    """Escape single quotes for SQL"""
    return text.replace("'", "''")

# Process the data
rows = []
for line in SALES_DATA.strip().split('\n'):
    if not line.strip() or line.startswith('CUST NO'):
        continue
        
    parts = line.split('\t')
    if len(parts) < 11:
        continue
        
    customer_code = escape_sql(parts[0].strip())
    customer_name = escape_sql(parts[1].strip())
    item_sku = escape_sql(parts[2].strip())
    item_desc = escape_sql(parts[3].strip())
    province = escape_sql(parts[4].strip())
    invoice_no = escape_sql(parts[5].strip())
    sale_date = parse_date(parts[6].strip())
    location = escape_sql(parts[7].strip())
    qty_sold = clean_number(parts[8])
    unit_price = clean_number(parts[9])
    total_amount = clean_number(parts[10])
    
    sql_row = f"      ('{customer_code}', '{customer_name}', '{item_sku}', '{item_desc}', '{province}', '{invoice_no}', '{sale_date}', '{location}', {qty_sold}, {unit_price}, {total_amount})"
    rows.append(sql_row)

# Join all rows with commas and semicolon at end
output = ',\n'.join(rows) + ';'

# Write to file
with open('sql-values-output.txt', 'w', encoding='utf-8') as f:
    f.write(output)
