import pyodbc
from datetime import datetime
from decimal import Decimal

# Database connection
conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=ngcandu.database.windows.net;"
    "DATABASE=MedicalManagementDB;"
    "UID=ngcandu;"
    "PWD=Pass@123"
)

# Sales data from CSV
sales_data = [
    {"Institution": "DEPARTMENT OF HEALTH LIMPOPO", "Province": "Limpopo", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157895", "Qty": 2290, "Amount": 312654.69, "Status": "Delivered"},
    {"Institution": "DEPARTMENT OF HEALTH LIMPOPO", "Province": "Limpopo", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157897", "Qty": 1565, "Amount": 213670.13, "Status": "Delivered"},
    {"Institution": "DEPARTMENT OF HEALTH LIMPOPO", "Province": "Limpopo", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157896", "Qty": 6000, "Amount": 269060.87, "Status": "Delivered"},
    {"Institution": "DEPARTMENT OF HEALTH LIMPOPO", "Province": "Limpopo", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157898", "Qty": 1000, "Amount": 44843.48, "Status": "Delivered"},
    {"Institution": "MANKWENG HOSPITAL PHARMACY", "Province": "Limpopo", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157894", "Qty": 1500, "Amount": 67265.22, "Status": "Delivered"},
    {"Institution": "THELLE MOGOERANE HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157873", "Qty": 50, "Amount": 6826.52, "Status": "Delivered"},
    {"Institution": "HILLBROW CHC", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157874", "Qty": 300, "Amount": 0, "Status": "Delivered"},
    {"Institution": "HILLBROW CHC", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157874", "Qty": 3000, "Amount": 134530.43, "Status": "Delivered"},
    {"Institution": "DR. GEORGE MUKHARI HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157868", "Qty": 1000, "Amount": 136530.43, "Status": "Delivered"},
    {"Institution": "DR. GEORGE MUKHARI HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157869", "Qty": 1500, "Amount": 67265.22, "Status": "Delivered"},
    {"Institution": "FAR EAST RAND HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157887", "Qty": 400, "Amount": 54612.17, "Status": "Delivered"},
    {"Institution": "FAR EAST RAND HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157888", "Qty": 1500, "Amount": 67265.22, "Status": "Delivered"},
    {"Institution": "BHEKI MLANGENI DISTRICT HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER - BATTERY", "Date": "2025/09/01", "Invoice": "IN157879", "Qty": 0, "Amount": 0, "Status": "Delivered"},
    {"Institution": "BHEKI MLANGENI DISTRICT HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157879", "Qty": 500, "Amount": 22421.74, "Status": "Delivered"},
    {"Institution": "KALAFONG HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157878", "Qty": 2500, "Amount": 112108.69, "Status": "Delivered"},
    {"Institution": "CHARLOTTE MAXEKE HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157867", "Qty": 560, "Amount": 76457.04, "Status": "Delivered"},
    {"Institution": "CHARLOTTE MAXEKE HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157885", "Qty": 1500, "Amount": 67265.22, "Status": "Delivered"},
    {"Institution": "KOPANONG HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157871", "Qty": 200, "Amount": 27306.09, "Status": "Delivered"},
    {"Institution": "SOUTH RAND HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157870", "Qty": 100, "Amount": 0, "Status": "Delivered"},
    {"Institution": "SOUTH RAND HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER - BATTERY", "Date": "2025/09/01", "Invoice": "IN157870", "Qty": 0, "Amount": 0, "Status": "Delivered"},
    {"Institution": "SOUTH RAND HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157870", "Qty": 1000, "Amount": 44843.48, "Status": "Delivered"},
    {"Institution": "SOUTH RAND HOSPITAL", "Province": "Gauteng", "Item": "GLOCOSE METER - QUALITY CONTROL SOLUTIONS", "Date": "2025/09/01", "Invoice": "IN157870", "Qty": 20, "Amount": 482.08, "Status": "Delivered"},
    {"Institution": "GERMISTON HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157883", "Qty": 220, "Amount": 0, "Status": "Delivered"},
    {"Institution": "GERMISTON HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157883", "Qty": 1000, "Amount": 44843.48, "Status": "Delivered"},
    {"Institution": "RAHIMA MOOSA MOTHER & CHILD HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157893", "Qty": 1500, "Amount": 67265.22, "Status": "Delivered"},
    {"Institution": "HELEN JOSEPH HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157876", "Qty": 500, "Amount": 68265.22, "Status": "Delivered"},
    {"Institution": "HELEN JOSEPH HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157875", "Qty": 3000, "Amount": 134530.43, "Status": "Delivered"},
    {"Institution": "TAMBO MEMORIAL HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157866", "Qty": 100, "Amount": 0, "Status": "Delivered"},
    {"Institution": "TAMBO MEMORIAL HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157880", "Qty": 1000, "Amount": 44843.48, "Status": "Delivered"},
    {"Institution": "MAMELODI HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157872", "Qty": 200, "Amount": 27306.09, "Status": "Delivered"},
    {"Institution": "PRETORIA WEST HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157886", "Qty": 200, "Amount": 27306.09, "Status": "Delivered"},
    {"Institution": "SEBOKENG HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157884", "Qty": 300, "Amount": 0, "Status": "Delivered"},
    {"Institution": "SEBOKENG HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157884", "Qty": 3000, "Amount": 134530.43, "Status": "Delivered"},
    {"Institution": "TEMBISA HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157892", "Qty": 1500, "Amount": 67265.22, "Status": "Delivered"},
    {"Institution": "STEVE BIKO ACADEMIC HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157890", "Qty": 300, "Amount": 40959.13, "Status": "Delivered"},
    {"Institution": "STEVE BIKO ACADEMIC HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157891", "Qty": 1000, "Amount": 44843.48, "Status": "Delivered"},
    {"Institution": "HEALTH TSHWANE REGION C", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157889", "Qty": 170, "Amount": 0, "Status": "Delivered"},
    {"Institution": "HEALTH TSHWANE REGION C", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157889", "Qty": 1000, "Amount": 44843.48, "Status": "Delivered"},
    {"Institution": "TSHWANE DISTRICT HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157877", "Qty": 200, "Amount": 0, "Status": "Delivered"},
    {"Institution": "TSHWANE DISTRICT HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157877", "Qty": 1500, "Amount": 67265.22, "Status": "Delivered"},
    {"Institution": "MEDICAL SUPPLY DEPOT TRANSITO -IN", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/01", "Invoice": "IN157882", "Qty": 1000, "Amount": 136530.43, "Status": "Delivered"},
    {"Institution": "MEDICAL SUPPLY DEPOT TRANSITO -IN", "Province": "Gauteng", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/01", "Invoice": "IN157881", "Qty": 3000, "Amount": 134530.43, "Status": "Delivered"},
    {"Institution": "PROVINCIAL PHARM SUPPLY DEPOT", "Province": "Kwa-Zulu Natal", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/02", "Invoice": "IN157947", "Qty": 200, "Amount": 27306.09, "Status": "Delivered"},
    {"Institution": "PROVINCIAL PHARM SUPPLY DEPOT", "Province": "Kwa-Zulu Natal", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157948", "Qty": 1350, "Amount": 60538.69, "Status": "Delivered"},
    {"Institution": "PROVINCIAL PHARM SUPPLY DEPOT", "Province": "Kwa-Zulu Natal", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157949", "Qty": 74, "Amount": 3318.42, "Status": "Delivered"},
    {"Institution": "PROVINCIAL PHARM SUPPLY DEPOT", "Province": "Kwa-Zulu Natal", "Item": "HBA1C TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157950", "Qty": 20, "Amount": 35274.09, "Status": "Delivered"},
    {"Institution": "PROVINCIAL PHARM SUPPLY DEPOT", "Province": "Kwa-Zulu Natal", "Item": "HBA1C TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157951", "Qty": 2, "Amount": 3527.41, "Status": "Delivered"},
    {"Institution": "DEPARTMENT OF HEALTH LIMPOPO", "Province": "Limpopo", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157946", "Qty": 6000, "Amount": 269060.87, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/02", "Invoice": "IN157919", "Qty": 350, "Amount": 47785.65, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/02", "Invoice": "IN157920", "Qty": 50, "Amount": 6826.52, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/02", "Invoice": "IN157923", "Qty": 20, "Amount": 2730.61, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/02", "Invoice": "IN157924", "Qty": 3000, "Amount": 409591.3, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/02", "Invoice": "IN157925", "Qty": 150, "Amount": 20479.56, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/02", "Invoice": "IN157927", "Qty": 100, "Amount": 13653.04, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/02", "Invoice": "IN157929", "Qty": 50, "Amount": 6826.52, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/02", "Invoice": "IN157933", "Qty": 15, "Amount": 2047.96, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157921", "Qty": 100, "Amount": 4484.35, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157922", "Qty": 40, "Amount": 1793.74, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157926", "Qty": 600, "Amount": 26906.09, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157928", "Qty": 160, "Amount": 7174.96, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157930", "Qty": 120, "Amount": 5381.22, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157931", "Qty": 1200, "Amount": 53812.17, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157934", "Qty": 30, "Amount": 1345.3, "Status": "Delivered"},
    {"Institution": "BLOEMFONTEIN MEDICAL DEPOT", "Province": "Free State", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157935", "Qty": 30, "Amount": 1345.3, "Status": "Delivered"},
    {"Institution": "FS HEALTH THABO MOFUTSANYANA DISTRICT", "Province": "Free State", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/02", "Invoice": "IN157932", "Qty": 30, "Amount": 4095.91, "Status": "Delivered"},
    {"Institution": "FS HEALTH THABO MOFUTSANYANA DISTRICT", "Province": "Free State", "Item": "GLUCOSE METER - BATTERY", "Date": "2025/09/02", "Invoice": "IN157932", "Qty": 0, "Amount": 0, "Status": "Delivered"},
    {"Institution": "FS HEALTH THABO MOFUTSANYANA DISTRICT", "Province": "Free State", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/02", "Invoice": "IN157932", "Qty": 800, "Amount": 35874.78, "Status": "Delivered"},
    {"Institution": "FS HEALTH THABO MOFUTSANYANA DISTRICT", "Province": "Free State", "Item": "GLOCOSE METER - QUALITY CONTROL SOLUTIONS", "Date": "2025/09/02", "Invoice": "IN157932", "Qty": 11, "Amount": 265.15, "Status": "Delivered"},
    {"Institution": "PROVINCIAL PHARM SUPPLY DEPOT", "Province": "Kwa-Zulu Natal", "Item": "GLUCOSE TEST STRIPS", "Date": "2025/09/30", "Invoice": "IN159027", "Qty": 1000, "Amount": 44843.48, "Status": "Not delivered"},
    {"Institution": "PROVINCIAL PHARM SUPPLY DEPOT", "Province": "Kwa-Zulu Natal", "Item": "HBA1C TEST STRIPS", "Date": "2025/09/30", "Invoice": "IN159026", "Qty": 6, "Amount": 10582.23, "Status": "Not delivered"},
    {"Institution": "KALAFONG HOSPITAL", "Province": "Gauteng", "Item": "GLUCOSE METER- BIO HERMES", "Date": "2025/09/30", "Invoice": "IN159047", "Qty": 300, "Amount": 0, "Status": "Not delivered"}
]

try:
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
    
    print("Connected to database successfully!")
    
    # Get inventory item IDs
    cursor.execute("SELECT Id, Name FROM InventoryItem WHERE Name IN (?, ?, ?, ?, ?)",
                   ('GLUCOSE METER- BIO HERMES', 'GLUCOSE TEST STRIPS', 'GLUCOSE METER - BATTERY', 
                    'GLOCOSE METER - QUALITY CONTROL SOLUTIONS', 'HBA1C TEST STRIPS'))
    inventory_items = {row.Name: row.Id for row in cursor.fetchall()}
    
    print(f"Found {len(inventory_items)} inventory items")
    
    # Group by invoice number
    invoices = {}
    for sale in sales_data:
        invoice_num = sale['Invoice']
        if invoice_num not in invoices:
            invoices[invoice_num] = {
                'institution': sale['Institution'],
                'province': sale['Province'],
                'date': sale['Date'],
                'status': sale['Status'],
                'items': []
            }
        invoices[invoice_num]['items'].append(sale)
    
    print(f"Processing {len(invoices)} unique invoices...")
    
    sales_imported = 0
    items_imported = 0
    
    for invoice_num, invoice_data in invoices.items():
        # Check if invoice already exists
        cursor.execute("SELECT COUNT(*) FROM Sale WHERE SaleNumber = ?", invoice_num)
        if cursor.fetchone()[0] > 0:
            print(f"  - Skipped: {invoice_num} (already exists)")
            continue
        
        # Calculate total
        total = sum(item['Amount'] for item in invoice_data['items'])
        sale_date = datetime.strptime(invoice_data['date'], '%Y/%m/%d')
        delivery_status = 1 if invoice_data['status'] == 'Delivered' else 0
        payment_status = 1 if invoice_data['status'] == 'Delivered' else 0
        
        # Insert sale
        cursor.execute("""
            INSERT INTO Sale (SaleNumber, SaleDate, CustomerId, CustomerName, CustomerEmail, CustomerPhone, 
                            Subtotal, TaxAmount, Discount, Total, PaymentMethod, PaymentStatus, DeliveryStatus, 
                            Notes, IsDeleted, CreatedDate, CreatedBy)
            VALUES (?, ?, ?, ?, NULL, NULL, ?, 0, 0, ?, 1, ?, ?, ?, 0, GETDATE(), 0)
        """, (invoice_num, sale_date, 1, invoice_data['institution'], total, total, 
              payment_status, delivery_status, f"Province: {invoice_data['province']}"))
        
        conn.commit()  # Commit to get the ID
        
        cursor.execute("SELECT CAST(IDENT_CURRENT('Sale') AS INT)")
        sale_id = cursor.fetchone()[0]
        sales_imported += 1
        
        # Insert sale items
        for item in invoice_data['items']:
            item_name = item['Item']
            if item_name in inventory_items:
                quantity = item['Qty']
                total_price = item['Amount']
                unit_price = Decimal(total_price) / Decimal(quantity) if quantity > 0 else Decimal(0)
                
                cursor.execute("""
                    INSERT INTO SaleItem (SaleId, InventoryItemId, Quantity, UnitPrice, TotalPrice, IsDeleted)
                    VALUES (?, ?, ?, ?, ?, 0)
                """, (sale_id, inventory_items[item_name], quantity, unit_price, total_price))
                
                items_imported += 1
        
        conn.commit()  # Commit after each invoice
        print(f"  [OK] Imported: {invoice_num} ({len(invoice_data['items'])} items, Total: R{total:.2f})")
    
    print("\n" + "="*50)
    print("IMPORT COMPLETE")
    print("="*50)
    print(f"Sales imported: {sales_imported}")
    print(f"Sale items imported: {items_imported}")
    print("="*50)
    
except Exception as e:
    print(f"Error: {e}")
    conn.rollback()
finally:
    if conn:
        conn.close()
