import pyodbc
from datetime import datetime
import csv
from io import StringIO

# Database connection string (update with your actual credentials)
# Using Windows Authentication
connection_string = 'Driver={ODBC Driver 17 for SQL Server};Server=localhost;Database=MedicalHistory;Trusted_Connection=yes;'

# Sales data to insert
sales_data = """08-GP1-035	MERAFONG SUB DISTRICT	NDOH35017	GLUCOSE TEST STRIPS	2025/11/03	IN160219	800.0000		35874.78	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35018	GLOCOSE METER - QUALITY CONTROL SOLUTIONS	2025/11/03	IN160219	16.0000		385.67	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35019	MULTIPARAMETER - 50 KETONE TEST STRIPS VIAL	2025/11/03	IN160219	34.0000		13623.06	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35020	MULTIPARAMETER - 50 URIC ACID VIAL	2025/11/03	IN160219	34.0000		9364.79	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35021	MULTIPARAMETER - 50 CHOLESTEROL VIAL	2025/11/03	IN160219	34.0000		23411.21	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35022	MULTIPARAMETER - 50 LACTATE VIAL	2025/11/03	IN160219	34.0000		29796.72	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35026	MULTIPARAMETER - KETONE CONTROL SOLUTION (LOW)	2025/11/03	IN160219	0.0000		0.00	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35028	MULTIPARAMETER - CHOLESTEROL CONTROL SOLUTIONS (LOW)	2025/11/03	IN160219	0.0000		0.00	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35030	MULTIPARAMETER - URIC ACID CONTROL SOLUTION (HIGH)	2025/11/03	IN160219	0.0000		0.00	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35032	MULTIPARAMETER - LACTATE CONTROL SOLUTION (HIGH)	2025/11/03	IN160219	0.0000		0.00	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35034	HBA1C TEST STRIPS	2025/11/03	IN160219	55.0000		97003.74	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35036	DUAL GLUCOSE & HBA1C - QUALITY CONTROL SOLUTION HBA1C	2025/11/03	IN160219	0.0000		0.00	TO BE PAID
08-GP1-035	MERAFONG SUB DISTRICT	NDOH35037	DUAL GLUCOSE & HBA1C - QUALITY CONTROL SOLUTIONS GLUCOSE	2025/11/03	IN160219	16.0000		385.67	TO BE PAID"""

try:
    # Connect to database
    conn = pyodbc.connect(connection_string)
    cursor = conn.cursor()
    
    # Parse the data
    rows = [row.split('\t') for row in sales_data.strip().split('\n')]
    
    # Get or create customer record for the district
    customer_name = "MERAFONG SUB DISTRICT"
    
    # Check if customer exists
    cursor.execute("SELECT [Id] FROM [dbo].[Customers] WHERE [Name] = ?", (customer_name,))
    customer_result = cursor.fetchone()
    
    if customer_result:
        customer_id = customer_result[0]
        print(f"Using existing customer ID: {customer_id}")
    else:
        # For now, we'll use a default customer ID
        # You should check what customers exist in your database
        customer_id = 1
        print(f"Warning: Using default customer ID: {customer_id}")
    
    # Get or create inventory items
    sale_total = 0
    items_data = []
    
    for row in rows:
        sale_number = row[0]
        district = row[1]
        product_code = row[2]
        product_desc = row[3]
        sale_date = row[4]
        invoice_number = row[5]
        quantity = float(row[6])
        # row[7] is empty
        amount = float(row[8])
        status = row[9]
        
        # Format date
        date_obj = datetime.strptime(sale_date, '%Y/%m/%d')
        
        # Check if inventory item exists by product code
        cursor.execute("""SELECT [Id] FROM [dbo].[InventoryItems] 
                         WHERE [ProductCode] = ? OR [Description] LIKE ?""", 
                      (product_code, f"%{product_desc}%"))
        item_result = cursor.fetchone()
        
        if item_result:
            item_id = item_result[0]
            print(f"Found inventory item: {product_code} (ID: {item_id})")
        else:
            print(f"Warning: Inventory item not found for {product_code} - {product_desc}")
            # We'll need to create it or skip
            item_id = None
        
        if item_id:
            items_data.append({
                'product_code': product_code,
                'item_id': item_id,
                'quantity': quantity,
                'unit_price': amount / quantity if quantity > 0 else 0,
                'total_price': amount
            })
            sale_total += amount
    
    if not items_data:
        print("Error: No valid items found to insert")
    else:
        # Create sale record
        invoice_number = "IN160219"
        sale_date = datetime.strptime("2025/11/03", '%Y/%m/%d')
        
        insert_sale_sql = """INSERT INTO [dbo].[Sales] 
            ([SaleNumber], [SaleDate], [CustomerId], [CustomerName], [CustomerPhone], 
             [Subtotal], [Total], [ProvinceId], [Notes], [IsDeleted], [CreatedDate], [CreatedBy])
            OUTPUT INSERTED.[Id]
            VALUES (?, ?, ?, ?, NULL, ?, ?, NULL, ?, 0, GETDATE(), 1)"""
        
        notes = f"Imported from {invoice_number}"
        
        cursor.execute(insert_sale_sql, 
                      (invoice_number, sale_date, customer_id, customer_name, sale_total, sale_total, notes))
        sale_id = cursor.fetchone()[0]
        print(f"Created sale record with ID: {sale_id}, Total: {sale_total}")
        
        # Insert sale items
        insert_item_sql = """INSERT INTO [dbo].[SaleItems] 
            ([SaleId], [InventoryItemId], [Quantity], [UnitPrice], [TotalPrice], 
             [IsDeleted], [CreatedDate], [CreatedBy])
            VALUES (?, ?, ?, ?, ?, 0, GETDATE(), 1)"""
        
        for item in items_data:
            cursor.execute(insert_item_sql,
                          (sale_id, item['item_id'], item['quantity'], 
                           item['unit_price'], item['total_price']))
            print(f"  Added item: {item['product_code']} - Qty: {item['quantity']}, Price: {item['total_price']}")
        
        conn.commit()
        print("\nAll sales data inserted successfully!")

except pyodbc.Error as e:
    print(f"Database error: {e}")
    conn.rollback()
except Exception as e:
    print(f"Error: {e}")
    if conn:
        conn.rollback()
finally:
    if conn:
        conn.close()
