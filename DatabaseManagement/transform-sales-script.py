import re

# Read the input file
with open('insert-sales.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Pattern to match the old format VALUES lines
# Example: ('IN157874', '2025-09-01', 1, 'HILLBROW CHC', NULL, NULL, 
#           134530.43, 0, 0, 134530.43, 4, 2, 3, 1, 'GLUCOSE METER (300) + GLUCOSE TEST STRIPS (3000)', 0, GETDATE(), 1),

# This regex matches a line with the old 17-column pattern:
# SaleNumber, Date, CustomerId, CustomerName, CustomerEmail(NULL), CustomerPhone(NULL), 
# Subtotal, TaxAmount(0), Discount(0), Total, PaymentMethod(4), PaymentStatus(2/1), DeliveryStatus(3/1),
# ProvinceId, Notes, IsDeleted(0), CreatedDate(GETDATE()), CreatedBy(1)

pattern = r"(\('IN\d+', '\d{4}-\d{2}-\d{2}', \d+, '[^']+', NULL), NULL,\s+(\d+\.?\d*), 0, 0, (\d+\.?\d*), \d+, \d+, \d+, (\d+|NULL), ('[^']+'), 0, GETDATE\(\), (\d+)\),"

def replacement(match):
    # Group 1: ('IN157874', '2025-09-01', 1, 'HILLBROW CHC', NULL)
    # Group 2: Subtotal (134530.43)
    # Group 3: Total (134530.43)  
    # Group 4: ProvinceId (1 or NULL)
    # Group 5: Notes ('GLUCOSE METER...')
    # Group 6: CreatedBy (1)
    
    prefix = match.group(1)  # Up to and including first NULL (CustomerPhone)
    subtotal = match.group(2)
    total = match.group(3)
    province_id = match.group(4)
    notes = match.group(5)
    created_by = match.group(6)
    
    # New format: prefix, subtotal, total, provinceId, notes, isDeleted(0), createdBy
    return f"{prefix}, \n     {subtotal}, {total}, {province_id}, {notes}, 0, {created_by}),"

# Apply the transformation
transformed_content = re.sub(pattern, replacement, content, flags=re.MULTILINE)

# Write the output
with open('insert-sales-transformed.sql', 'w', encoding='utf-8') as f:
    f.write(transformed_content)

print("Transformation complete! Check insert-sales-transformed.sql")

# Count how many replacements were made
original_lines = len(re.findall(r"0, GETDATE\(\), 1\),", content))
transformed_lines = len(re.findall(r"0, GETDATE\(\), 1\),", transformed_content))
print(f"Original old-format lines: {original_lines}")
print(f"Remaining old-format lines: {transformed_lines}")
print(f"Transformed: {original_lines - transformed_lines} lines")
