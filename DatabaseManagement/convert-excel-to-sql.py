"""
Quick converter for Excel sales data to SQL INSERT format
Paste your tab-delimited data from Excel and this will generate SQL
"""

def convert_to_sql(data_text):
    """Convert tab-delimited text to SQL VALUES"""
    lines = [l.strip() for l in data_text.strip().split('\n') if l.strip()]
    
    sql_values = []
    for line in lines:
        parts = line.split('\t')
        if len(parts) < 11:
            continue
        
        # Clean and format each field
        cust_code = parts[0].strip()
        cust_name = parts[1].strip().replace("'", "''")
        item_sku = parts[2].strip()
        item_desc = parts[3].strip().replace("'", "''")
        province = parts[4].strip()
        invoice = parts[5].strip()
        
        # Date conversion (YYYY/MM/DD to YYYY-MM-DD)
        date = parts[6].strip().replace('/', '-')
        
        location = parts[7].strip()
        
        # Number cleaning (remove R, spaces, commas)
        qty = parts[8].replace(',', '').replace(' ', '').strip()
        price = parts[9].replace('R', '').replace(',', '').replace(' ', '').strip()
        total = parts[10].replace('R', '').replace(',', '').replace(' ', '').strip()
        
        # Format SQL row
        sql = f"('{cust_code}', '{cust_name}', '{item_sku}', '{item_desc}', '{province}', '{invoice}', '{date}', '{location}', {qty}, {price}, {total})"
        sql_values.append(sql)
    
    return sql_values

# PASTE YOUR DATA HERE (from Excel, tab-separated)
# Example format:
# CUST NO	CUSTOMER NAME	ITEM	DESC	REG	INV No	Date	LOCATION	QTYSOLD	UnitPrice	SALES AMNT incl

data = """
PASTE_YOUR_EXCEL_DATA_HERE
"""

if "PASTE_YOUR_EXCEL_DATA_HERE" not in data:
    values = convert_to_sql(data)
    
    print("-- Generated SQL INSERT VALUES")
    print("-- Copy this into import-sales-records-2025.sql")
    print("")
    
    for i, val in enumerate(values):
        if i < len(values) - 1:
            print(f"    {val},")
        else:
            print(f"    {val};")
    
    print(f"\n-- Total rows: {len(values)}")
else:
    print("Please paste your Excel data into the 'data' variable above")
