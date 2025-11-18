import re

# Read the file
with open('insert-sales.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Pattern to match the old format VALUES lines with extra columns
# Old: ('INxxxxx', 'date', id, 'name', NULL, NULL, amount, 0, 0, amount, 4, 2, 3, province, 'notes', 0, GETDATE(), 1)
# New: ('INxxxxx', 'date', id, 'name', NULL, amount, amount, province, 'notes', 0, 1)

def fix_value_line(match):
    """Convert old format to new format"""
    full_line = match.group(0)
    
    # Extract the values using regex
    pattern = r"\('([^']+)',\s*'([^']+)',\s*(\d+),\s*'([^']+)',\s*([^,]+),\s*([^,]+),\s*([0-9.]+),\s*([0-9.]+),\s*([0-9.]+),\s*([0-9.]+),\s*(\d+),\s*(\d+),\s*(\d+),\s*([^,]+),\s*'([^']*)',\s*(\d+),\s*([^,]+),\s*(\d+)\)"
    
    value_match = re.search(pattern, full_line)
    if value_match:
        invoice = value_match.group(1)
        date = value_match.group(2)
        customer_id = value_match.group(3)
        customer_name = value_match.group(4)
        # Skip customerPhone (group 5) and customerEmail (group 6)
        # Skip subtotal (group 7), taxAmount (group 8), discount (group 9)
        total = value_match.group(10)
        # Skip paymentMethod (group 11), paymentStatus (group 12), deliveryStatus (group 13)
        province_id = value_match.group(14)
        notes = value_match.group(15)
        is_deleted = value_match.group(16)
        # Skip createdDate (group 17)
        created_by = value_match.group(18)
        
        # Build new format
        new_line = f"    ('{invoice}', '{date}', {customer_id}, '{customer_name}', NULL, \n     {total}, {total}, {province_id}, '{notes}', {is_deleted}, {created_by})"
        
        # Preserve the trailing comma or semicolon
        if full_line.strip().endswith(');'):
            new_line += ');'
        elif full_line.strip().endswith(','):
            new_line += ','
        
        return new_line
    
    return full_line

# Find and replace all old-format VALUE lines
# Match multi-line VALUE entries
pattern = r"\('IN\d+',\s*'[^']+',\s*\d+,\s*'[^']+',\s*[^,]+,\s*[^,]+,\s*[0-9.]+,\s*[0-9.]+,\s*[0-9.]+,\s*[0-9.]+,\s*\d+,\s*\d+,\s*\d+,\s*[^,]+,\s*'[^']*',\s*\d+,\s*[^,]+,\s*\d+\)[;,]?"

content = re.sub(pattern, fix_value_line, content, flags=re.MULTILINE | re.DOTALL)

# Write the fixed content
with open('insert-sales-fixed.sql', 'w', encoding='utf-8') as f:
    f.write(content)

print("Fixed SQL file written to: insert-sales-fixed.sql")
print("Review the file and then rename it to insert-sales.sql if it looks correct")
