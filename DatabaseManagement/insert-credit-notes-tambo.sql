-- =============================================================================
-- Insert Credit Notes for TAMBO MEMORIAL HOSPITAL
-- =============================================================================
-- Credit Note: CN103079
-- Customer: TAMBO MEMORIAL HOSPITAL (08-GP1-019)
-- Date: 2025/08/07
-- Total Credit: R97,901.89
-- =============================================================================

SET NOCOUNT ON;

PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Adding Credit Notes for TAMBO MEMORIAL HOSPITAL';
PRINT '════════════════════════════════════════════════════════════════';
PRINT '';

BEGIN TRY
    BEGIN TRANSACTION;

    -- Variables
    DECLARE @CreditNoteNumber NVARCHAR(50) = 'CN103079';
    DECLARE @CustomerCode NVARCHAR(50) = '08-GP1-019';
    DECLARE @CustomerName NVARCHAR(200) = 'TAMBO MEMORIAL HOSPITAL';
    DECLARE @CreditDate DATETIME = '2025-08-07';
    DECLARE @InvoiceId INT;
    DECLARE @InvoiceNumber NVARCHAR(50);
    DECLARE @TotalCreditAmount DECIMAL(18,2) = 97901.89;

    -- Check if credit note already exists
    IF EXISTS (SELECT 1 FROM CreditNotes WHERE CreditNoteNumber = @CreditNoteNumber AND IsDeleted = 0)
    BEGIN
        PRINT '  ⚠ Credit Note ' + @CreditNoteNumber + ' already exists. Skipping...';
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Find the related sale/invoice
    -- Looking for sales from this customer
    SELECT TOP 1 
        @InvoiceId = Id,
        @InvoiceNumber = SaleNumber
    FROM Sale
    WHERE CustomerName = @CustomerName
        AND IsDeleted = 0
    ORDER BY SaleDate DESC;

    IF @InvoiceId IS NULL
    BEGIN
        PRINT '  ⚠ No invoice found for ' + @CustomerName + '. Creating credit note without invoice link...';
        SET @InvoiceNumber = 'UNKNOWN';
        SET @InvoiceId = 0;  -- Placeholder
    END
    ELSE
    BEGIN
        PRINT '  ✓ Found Invoice: ' + @InvoiceNumber + ' (ID: ' + CAST(@InvoiceId AS NVARCHAR(10)) + ')';
    END

    -- Insert main credit note record
    INSERT INTO CreditNotes (
        CreditNoteNumber,
        InvoiceId,
        InvoiceNumber,
        CustomerId,
        CustomerName,
        OriginalAmount,
        CreditAmount,
        Reason,
        Status,
        ReverseStock,
        ReverseSale,
        Notes,
        DateCreated,
        CreatedBy,
        DateUpdated,
        UpdatedBy,
        IsDeleted
    )
    VALUES (
        @CreditNoteNumber,
        @InvoiceId,
        ISNULL(@InvoiceNumber, 'UNKNOWN'),
        NULL,  -- CustomerId not available
        @CustomerName,
        @TotalCreditAmount,  -- OriginalAmount
        @TotalCreditAmount,  -- CreditAmount
        'Credit note for returned items - NDOH35004, NDOH35017, NDOH35018',
        'pending',  -- Status
        1,  -- ReverseStock = Yes (add items back to inventory)
        0,  -- ReverseSale = No (keep sale record)
        'Items: ' + CHAR(13) + CHAR(10) +
        '- NDOH35004: GLUCOSE METER- BIO HERMES (Qty: 217) - Credit: R29,627.10' + CHAR(13) + CHAR(10) +
        '- NDOH35017: GLUCOSE TEST STRIPS (Qty: 1,200) - Credit: R53,812.18' + CHAR(13) + CHAR(10) +
        '- NDOH35018: GLOCOSE METER - QUALITY CONTROL SOLUTIONS (Qty: 600) - Credit: R14,462.61' + CHAR(13) + CHAR(10) +
        'Total Credit: R97,901.89',
        @CreditDate,
        1,  -- CreatedBy (system user)
        GETDATE(),
        1,  -- UpdatedBy
        0   -- IsDeleted
    );

    DECLARE @CreditNoteId INT = SCOPE_IDENTITY();
    PRINT '  ✓ Created Credit Note: ' + @CreditNoteNumber + ' (ID: ' + CAST(@CreditNoteId AS NVARCHAR(10)) + ')';
    PRINT '    Customer: ' + @CustomerName;
    PRINT '    Credit Amount: R' + CAST(@TotalCreditAmount AS NVARCHAR(20));
    PRINT '';

    -- Update Sale record if invoice was found
    IF @InvoiceId > 0
    BEGIN
        -- Check if Sale table has HasCreditNote column
        IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('dbo.Sale') AND name = 'HasCreditNote')
        BEGIN
            UPDATE Sale
            SET 
                HasCreditNote = 1,
                CreditedAmount = ISNULL(CreditedAmount, 0) + @TotalCreditAmount,
                LastUpdated = GETDATE(),
                ModifiedBy = 1
            WHERE Id = @InvoiceId;
            
            PRINT '  ✓ Updated Sale record - marked as having credit note';
        END
        ELSE
        BEGIN
            PRINT '  ⚠ Sale table does not have HasCreditNote column - skipping update';
        END
    END

    -- Optionally update inventory stock (reverse the sale)
    PRINT '';
    PRINT '  Inventory Adjustment (adding items back):';
    
    -- Item 1: NDOH35004 - GLUCOSE METER- BIO HERMES (+217 units)
    UPDATE InventoryItem
    SET 
        StockAvailable = StockAvailable + 217,
        LastUpdated = GETDATE(),
        UpdatedBy = 1
    WHERE SKU = 'NDOH35004' AND IsDeleted = 0;
    
    IF @@ROWCOUNT > 0
        PRINT '    ✓ NDOH35004: Added 217 units back to stock';
    ELSE
        PRINT '    ⚠ NDOH35004: Item not found - stock not adjusted';

    -- Item 2: NDOH35017 - GLUCOSE TEST STRIPS (+1,200 units)
    UPDATE InventoryItem
    SET 
        StockAvailable = StockAvailable + 1200,
        LastUpdated = GETDATE(),
        UpdatedBy = 1
    WHERE SKU = 'NDOH35017' AND IsDeleted = 0;
    
    IF @@ROWCOUNT > 0
        PRINT '    ✓ NDOH35017: Added 1,200 units back to stock';
    ELSE
        PRINT '    ⚠ NDOH35017: Item not found - stock not adjusted';

    -- Item 3: NDOH35018 - GLOCOSE METER - QUALITY CONTROL SOLUTIONS (+600 units)
    UPDATE InventoryItem
    SET 
        StockAvailable = StockAvailable + 600,
        LastUpdated = GETDATE(),
        UpdatedBy = 1
    WHERE SKU = 'NDOH35018' AND IsDeleted = 0;
    
    IF @@ROWCOUNT > 0
        PRINT '    ✓ NDOH35018: Added 600 units back to stock';
    ELSE
        PRINT '    ⚠ NDOH35018: Item not found - stock not adjusted';

    COMMIT TRANSACTION;
    
    PRINT '';
    PRINT '════════════════════════════════════════════════════════════════';
    PRINT '  ✅ Credit Note Created Successfully';
    PRINT '════════════════════════════════════════════════════════════════';
    PRINT '';

    -- Display summary
    PRINT 'Summary:';
    SELECT 
        Id,
        CreditNoteNumber,
        InvoiceNumber,
        CustomerName,
        CreditAmount,
        Status,
        DateCreated,
        ReverseStock,
        ReverseSale
    FROM CreditNotes
    WHERE CreditNoteNumber = @CreditNoteNumber;

    PRINT '';
    PRINT 'Updated Inventory Stock:';
    SELECT 
        SKU,
        Name,
        StockAvailable,
        Category
    FROM InventoryItem
    WHERE SKU IN ('NDOH35004', 'NDOH35017', 'NDOH35018')
        AND IsDeleted = 0;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    
    PRINT '';
    PRINT '════════════════════════════════════════════════════════════════';
    PRINT '  ❌ ERROR: Failed to create credit note';
    PRINT '════════════════════════════════════════════════════════════════';
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR(10));
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
    THROW;
END CATCH;
