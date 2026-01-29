-- =============================================================================
-- Import Missing Sale Records from CSV
-- =============================================================================
-- Total invoices to potentially import: 938
-- This script will only create Sales that don't already exist
-- =============================================================================

SET NOCOUNT ON;

PRINT '════════════════════════════════════════════════════════════════';
PRINT '  Importing Missing Sale Records';
PRINT '════════════════════════════════════════════════════════════════';

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @SalesBefore INT = (SELECT COUNT(*) FROM Sale WHERE IsDeleted = 0);
    PRINT 'Sales before: ' + CAST(@SalesBefore AS NVARCHAR(10));

    -- Invoice: IN152428
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152428' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152428', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-04-11', 0);
    END

    -- Invoice: IN152427
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152427' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152427', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-04-11', 0);
    END

    -- Invoice: IN152563
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152563' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152563', 'RK KHAN HOSPITAL', '2025-04-17', 0);
    END

    -- Invoice: IN152610
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152610' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152610', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-22', 0);
    END

    -- Invoice: IN152616
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152616' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152616', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-22', 0);
    END

    -- Invoice: IN152619
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152619' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152619', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-22', 0);
    END

    -- Invoice: IN152615
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152615' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152615', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-22', 0);
    END

    -- Invoice: IN152621
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152621' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152621', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-22', 0);
    END

    -- Invoice: IN152614
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152614' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152614', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-22', 0);
    END

    -- Invoice: IN152617
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152617' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152617', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-22', 0);
    END

    -- Invoice: IN152622
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152622' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152622', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-22', 0);
    END

    -- Invoice: IN152611
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152611' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152611', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-22', 0);
    END

    -- Invoice: IN152613
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152613' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152613', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-22', 0);
    END

    -- Invoice: IN152620
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152620' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152620', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-22', 0);
    END

    -- Invoice: IN152634
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152634' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152634', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-23', 0);
    END

    -- Invoice: IN152635
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152635' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152635', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-23', 0);
    END

    -- Invoice: IN152644
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152644' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152644', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-04-23', 0);
    END

    -- Invoice: IN152773
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152773' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152773', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-05-05', 0);
    END

    -- Invoice: IN152831
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152831' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152831', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-06', 0);
    END

    -- Invoice: IN152898
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152898' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152898', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-08', 0);
    END

    -- Invoice: IN152899
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152899' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152899', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-08', 0);
    END

    -- Invoice: IN152977
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152977' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152977', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-12', 0);
    END

    -- Invoice: IN152978
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152978' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152978', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-12', 0);
    END

    -- Invoice: IN152980
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152980' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152980', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-12', 0);
    END

    -- Invoice: IN152979
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN152979' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN152979', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-12', 0);
    END

    -- Invoice: IN153152
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153152' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153152', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-05-16', 0);
    END

    -- Invoice: IN153185
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153185' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153185', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-05-16', 0);
    END

    -- Invoice: IN153153
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153153' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153153', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-05-16', 0);
    END

    -- Invoice: IN153141
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153141' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153141', 'NC HEALTH DR HARRY SURTIE HOSPITAL', '2025-05-16', 0);
    END

    -- Invoice: IN153205
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153205' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153205', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-19', 0);
    END

    -- Invoice: IN153195
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153195' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153195', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-05-19', 0);
    END

    -- Invoice: IN153223
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153223' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153223', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-20', 0);
    END

    -- Invoice: IN153237
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153237' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153237', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-05-20', 0);
    END

    -- Invoice: IN153351
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153351' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153351', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-21', 0);
    END

    -- Invoice: IN153290
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153290' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153290', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-05-21', 0);
    END

    -- Invoice: IN153359
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153359' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153359', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-05-22', 0);
    END

    -- Invoice: IN153458
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153458' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153458', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-27', 0);
    END

    -- Invoice: IN153457
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153457' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153457', 'DEPARTMENT OF HEALTH MPUMALANGA', '2025-05-27', 0);
    END

    -- Invoice: IN153494
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153494' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153494', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-05-29', 0);
    END

    -- Invoice: IN153515
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153515' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153515', 'WITKOPPEN HEALTH & WELFARE CENTRE', '2025-05-30', 0);
    END

    -- Invoice: IN153714
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153714' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153714', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-03', 0);
    END

    -- Invoice: IN153715
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153715' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153715', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-03', 0);
    END

    -- Invoice: IN153716
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153716' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153716', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-03', 0);
    END

    -- Invoice: IN153718
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153718' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153718', 'ECONOCOM 47 C.C. TRADING AS QUALICON CONSTRUCTION', '2025-06-03', 0);
    END

    -- Invoice: IN153889
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153889' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153889', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-05', 0);
    END

    -- Invoice: IN153887
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153887' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153887', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-05', 0);
    END

    -- Invoice: IN153888
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN153888' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN153888', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-05', 0);
    END

    -- Invoice: IN154080
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154080' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154080', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-10', 0);
    END

    -- Invoice: IN154132
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154132' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154132', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-11', 0);
    END

    -- Invoice: IN154131
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154131' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154131', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-11', 0);
    END

    -- Invoice: IN154160
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154160' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154160', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-06-11', 0);
    END

    -- Invoice: IN154167
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154167' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154167', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-06-11', 0);
    END

    -- Invoice: IN154502
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154502' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154502', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-19', 0);
    END

    -- Invoice: IN154503
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154503' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154503', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-19', 0);
    END

    -- Invoice: IN154625
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154625' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154625', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-20', 0);
    END

    -- Invoice: IN154556
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154556' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154556', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-20', 0);
    END

    -- Invoice: IN154622
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154622' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154622', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-20', 0);
    END

    -- Invoice: IN154623
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154623' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154623', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-20', 0);
    END

    -- Invoice: IN154609
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154609' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154609', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-20', 0);
    END

    -- Invoice: IN154620
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154620' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154620', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-20', 0);
    END

    -- Invoice: IN154624
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154624' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154624', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-20', 0);
    END

    -- Invoice: IN154578
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154578' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154578', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-06-20', 0);
    END

    -- Invoice: IN154690
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154690' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154690', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-23', 0);
    END

    -- Invoice: IN154770
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154770' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154770', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-24', 0);
    END

    -- Invoice: IN154781
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154781' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154781', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-25', 0);
    END

    -- Invoice: IN154782
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154782' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154782', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-25', 0);
    END

    -- Invoice: IN154843
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154843' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154843', 'SOUTH RAND HOSPITAL', '2025-06-26', 0);
    END

    -- Invoice: IN154817
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154817' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154817', 'EDENVALE GENERAL HOSPITAL', '2025-06-26', 0);
    END

    -- Invoice: IN154910
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154910' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154910', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-06-30', 0);
    END

    -- Invoice: IN154907
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN154907' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN154907', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-06-30', 0);
    END

    -- Invoice: IN155123
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155123' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155123', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-03', 0);
    END

    -- Invoice: IN155119
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155119' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155119', 'HEALTH TSHWANE REGION C', '2025-07-03', 0);
    END

    -- Invoice: IN155259
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155259' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155259', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-07-04', 0);
    END

    -- Invoice: IN155219
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155219' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155219', 'FS HEALTH NATIONAL HOSPITAL', '2025-07-04', 0);
    END

    -- Invoice: IN155213
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155213' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155213', 'THELLE MOGOERANE HOSPITAL', '2025-07-04', 0);
    END

    -- Invoice: IN155263
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155263' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155263', 'HILLBROW CHC', '2025-07-04', 0);
    END

    -- Invoice: IN155222
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155222' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155222', 'KOPANONG HOSPITAL', '2025-07-04', 0);
    END

    -- Invoice: IN155217
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155217' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155217', 'KOPANONG HOSPITAL', '2025-07-04', 0);
    END

    -- Invoice: IN155258
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155258' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155258', 'GERMISTON HOSPITAL', '2025-07-04', 0);
    END

    -- Invoice: IN155215
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155215' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155215', 'RAHIMA MOOSA MOTHER & CHILD HOSPITAL', '2025-07-04', 0);
    END

    -- Invoice: IN155212
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155212' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155212', 'PHOLOSONG HOSPITAL', '2025-07-04', 0);
    END

    -- Invoice: IN155216
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155216' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155216', 'TAMBO MEMORIAL HOSPITAL', '2025-07-04', 0);
    END

    -- Invoice: IN155218
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155218' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155218', 'MAMELODI HOSPITAL', '2025-07-04', 0);
    END

    -- Invoice: IN155211
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155211' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155211', 'EDENVALE GENERAL HOSPITAL', '2025-07-04', 0);
    END

    -- Invoice: IN155260
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155260' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155260', 'HEALTH TSHWANE REGION C', '2025-07-04', 0);
    END

    -- Invoice: IN155418
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155418' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155418', 'FS HEALTH MOFUMAHADI MANAPO HOSPITAL', '2025-07-10', 0);
    END

    -- Invoice: IN155473
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155473' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155473', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-14', 0);
    END

    -- Invoice: IN155593
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155593' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155593', 'FS HEALTH BOTSHABELO HOSPITAL', '2025-07-16', 0);
    END

    -- Invoice: IN155697
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155697' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155697', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-18', 0);
    END

    -- Invoice: IN155883
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155883' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155883', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-23', 0);
    END

    -- Invoice: IN155884
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155884' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155884', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-23', 0);
    END

    -- Invoice: IN155885
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155885' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155885', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-23', 0);
    END

    -- Invoice: IN155886
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155886' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155886', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-23', 0);
    END

    -- Invoice: IN155927
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155927' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155927', 'HILLBROW CHC', '2025-07-23', 0);
    END

    -- Invoice: IN155928
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155928' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155928', 'CHARLOTTE MAXEKE HOSPITAL', '2025-07-23', 0);
    END

    -- Invoice: IN155929
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155929' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155929', 'CHARLOTTE MAXEKE HOSPITAL', '2025-07-23', 0);
    END

    -- Invoice: IN155925
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155925' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155925', 'SOUTH RAND HOSPITAL', '2025-07-23', 0);
    END

    -- Invoice: IN155926
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155926' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155926', 'HEALTH TSHWANE REGION C', '2025-07-23', 0);
    END

    -- Invoice: IN155984
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155984' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155984', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-24', 0);
    END

    -- Invoice: IN155982
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155982' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155982', 'DR. GEORGE MUKHARI HOSPITAL', '2025-07-24', 0);
    END

    -- Invoice: IN155985
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN155985' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN155985', 'DR. GEORGE MUKHARI HOSPITAL', '2025-07-24', 0);
    END

    -- Invoice: IN156074
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156074' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156074', 'BETHESDA HOSPITAL', '2025-07-25', 0);
    END

    -- Invoice: IN156075
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156075' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156075', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-25', 0);
    END

    -- Invoice: IN156076
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156076' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156076', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-25', 0);
    END

    -- Invoice: IN156073
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156073' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156073', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-25', 0);
    END

    -- Invoice: IN156072
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156072' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156072', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-25', 0);
    END

    -- Invoice: IN156077
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156077' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156077', 'SOUTH RAND HOSPITAL', '2025-07-25', 0);
    END

    -- Invoice: IN156160
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156160' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156160', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-28', 0);
    END

    -- Invoice: IN156159
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156159' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156159', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-28', 0);
    END

    -- Invoice: IN156186
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156186' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156186', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-29', 0);
    END

    -- Invoice: IN156185
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156185' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156185', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-29', 0);
    END

    -- Invoice: IN156223
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156223' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156223', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-30', 0);
    END

    -- Invoice: IN156224
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156224' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156224', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-30', 0);
    END

    -- Invoice: IN156225
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156225' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156225', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-30', 0);
    END

    -- Invoice: IN156226
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156226' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156226', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-30', 0);
    END

    -- Invoice: IN156227
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156227' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156227', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-30', 0);
    END

    -- Invoice: IN156228
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156228' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156228', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-30', 0);
    END

    -- Invoice: IN156250
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156250' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156250', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-07-31', 0);
    END

    -- Invoice: IN156408
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156408' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156408', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-01', 0);
    END

    -- Invoice: IN156410
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156410' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156410', 'MP HEALTH AMAJUBA HOSPITAL', '2025-08-01', 0);
    END

    -- Invoice: IN156409
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156409' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156409', 'MP HEALTH WITBANK HOSPITAL', '2025-08-01', 0);
    END

    -- Invoice: IN156442
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156442' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156442', 'NGWELEZANE HOSPITAL', '2025-08-02', 0);
    END

    -- Invoice: IN156441
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156441' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156441', 'FS HEALTH BOTSHABELO HOSPITAL', '2025-08-02', 0);
    END

    -- Invoice: IN156440
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156440' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156440', 'FS HEALTH PELONOMI HOSPITAL', '2025-08-02', 0);
    END

    -- Invoice: IN156443
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156443' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156443', 'FS HEALTH PHEKOLONG HOSPITAL', '2025-08-02', 0);
    END

    -- Invoice: IN156477
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156477' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156477', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-04', 0);
    END

    -- Invoice: IN156498
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156498' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156498', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-04', 0);
    END

    -- Invoice: IN156476
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156476' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156476', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-08-04', 0);
    END

    -- Invoice: IN156475
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156475' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156475', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-08-04', 0);
    END

    -- Invoice: IN156480
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156480' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156480', 'FS HEALTH PHEKOLONG HOSPITAL', '2025-08-04', 0);
    END

    -- Invoice: IN156503
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156503' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156503', 'FS HEALTH PHEKOLONG HOSPITAL', '2025-08-04', 0);
    END

    -- Invoice: IN156500
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156500' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156500', 'EC HEALTH BCM DISTR HUB', '2025-08-04', 0);
    END

    -- Invoice: IN156497
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156497' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156497', 'CHARLOTTE MAXEKE HOSPITAL', '2025-08-04', 0);
    END

    -- Invoice: IN156502
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156502' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156502', 'KOPANONG HOSPITAL', '2025-08-04', 0);
    END

    -- Invoice: IN156478
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156478' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156478', 'SIZWE TROPICAL DISEASE HOSPITAL', '2025-08-04', 0);
    END

    -- Invoice: IN156501
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156501' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156501', 'EDENVALE GENERAL HOSPITAL', '2025-08-04', 0);
    END

    -- Invoice: IN156495
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156495' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156495', 'HEALTH TSHWANE REGION C', '2025-08-04', 0);
    END

    -- Invoice: IN156499
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156499' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156499', 'DEPARTMENT OF HEALTH MPUMALANGA', '2025-08-04', 0);
    END

    -- Invoice: IN156504
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156504' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156504', 'MP HEALTH LYDENBURG HOSPITAL', '2025-08-04', 0);
    END

    -- Invoice: IN156479
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156479' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156479', 'MP HEALTH MAPULANENG HOSPITAL', '2025-08-04', 0);
    END

    -- Invoice: IN156572
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156572' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156572', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-08-05', 0);
    END

    -- Invoice: IN156583
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156583' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156583', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-08-05', 0);
    END

    -- Invoice: IN156584
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156584' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156584', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-08-05', 0);
    END

    -- Invoice: IN156528
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156528' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156528', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-08-05', 0);
    END

    -- Invoice: IN156530
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156530' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156530', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-08-05', 0);
    END

    -- Invoice: IN156531
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156531' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156531', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-08-05', 0);
    END

    -- Invoice: IN156532
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156532' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156532', 'FS HEALTH MOFUMAHADI MANAPO HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156529
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156529' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156529', 'FS HEALTH NATIONAL HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156533
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156533' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156533', 'FS HEALTH PELONOMI HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156576
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156576' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156576', 'THELLE MOGOERANE HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156585
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156585' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156585', 'FAR EAST RAND HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156587
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156587' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156587', 'FAR EAST RAND HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156579
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156579' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156579', 'KOPANONG HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156580
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156580' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156580', 'GERMISTON HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156575
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156575' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156575', 'RAHIMA MOOSA MOTHER & CHILD HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156578
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156578' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156578', 'PHOLOSONG HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156573
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156573' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156573', 'TAMBO MEMORIAL HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156586
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156586' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156586', 'TAMBO MEMORIAL HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156582
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156582' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156582', 'MAMELODI HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156581
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156581' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156581', 'PRETORIA WEST HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156574
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156574' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156574', 'PRETORIA WEST HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156588
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156588' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156588', 'SEBOKENG HOSPITAL', '2025-08-05', 0);
    END

    -- Invoice: IN156612
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156612' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156612', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-06', 0);
    END

    -- Invoice: IN156613
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156613' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156613', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-06', 0);
    END

    -- Invoice: IN156614
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156614' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156614', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-06', 0);
    END

    -- Invoice: IN156677
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156677' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156677', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-08', 0);
    END

    -- Invoice: IN156678
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156678' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156678', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-08', 0);
    END

    -- Invoice: IN156720
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156720' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156720', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-11', 0);
    END

    -- Invoice: IN156734
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156734' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156734', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-12', 0);
    END

    -- Invoice: IN156735
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156735' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156735', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-12', 0);
    END

    -- Invoice: IN156736
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156736' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156736', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-12', 0);
    END

    -- Invoice: IN156737
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156737' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156737', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-12', 0);
    END

    -- Invoice: IN156753
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156753' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156753', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-12', 0);
    END

    -- Invoice: IN156786
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156786' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156786', 'BHEKI MLANGENI DISTRICT HOSPITAL', '2025-08-12', 0);
    END

    -- Invoice: IN156787
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156787' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156787', 'HELEN JOSEPH HOSPITAL', '2025-08-12', 0);
    END

    -- Invoice: IN156788
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156788' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156788', 'HELEN JOSEPH HOSPITAL', '2025-08-12', 0);
    END

    -- Invoice: IN156729
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156729' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156729', 'TAMBO MEMORIAL HOSPITAL', '2025-08-12', 0);
    END

    -- Invoice: IN156835
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156835' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156835', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-13', 0);
    END

    -- Invoice: IN156838
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156838' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156838', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-13', 0);
    END

    -- Invoice: IN156836
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156836' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156836', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-13', 0);
    END

    -- Invoice: IN156833
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156833' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156833', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-13', 0);
    END

    -- Invoice: IN156834
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156834' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156834', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-13', 0);
    END

    -- Invoice: IN156837
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156837' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156837', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-13', 0);
    END

    -- Invoice: IN156845
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156845' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156845', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-08-13', 0);
    END

    -- Invoice: IN156846
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156846' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156846', 'FS HEALTH NATIONAL HOSPITAL', '2025-08-13', 0);
    END

    -- Invoice: IN156844
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156844' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156844', 'FS HEALTH PELONOMI HOSPITAL', '2025-08-13', 0);
    END

    -- Invoice: IN156803
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156803' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156803', 'HELEN JOSEPH HOSPITAL', '2025-08-13', 0);
    END

    -- Invoice: IN156804
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156804' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156804', 'TEMBISA HOSPITAL', '2025-08-13', 0);
    END

    -- Invoice: IN156843
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156843' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156843', 'WESKOPPIES HOSPITAL', '2025-08-13', 0);
    END

    -- Invoice: IN156802
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156802' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156802', 'STEVE BIKO ACADEMIC HOSPITAL', '2025-08-13', 0);
    END

    -- Invoice: IN156801
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156801' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156801', 'STEVE BIKO ACADEMIC HOSPITAL', '2025-08-13', 0);
    END

    -- Invoice: IN156800
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156800' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156800', 'TSHWANE DISTRICT HOSPITAL', '2025-08-13', 0);
    END

    -- Invoice: IN156829
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156829' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156829', 'TSHWANE DISTRICT HOSPITAL', '2025-08-13', 0);
    END

    -- Invoice: IN156842
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156842' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156842', 'DEPARTMENT OF HEALTH MPUMALANGA', '2025-08-13', 0);
    END

    -- Invoice: IN156850
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156850' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156850', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-14', 0);
    END

    -- Invoice: IN156851
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156851' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156851', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-14', 0);
    END

    -- Invoice: IN156852
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156852' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156852', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-14', 0);
    END

    -- Invoice: IN156878
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156878' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156878', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-14', 0);
    END

    -- Invoice: IN156882
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156882' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156882', 'RAHIMA MOOSA MOTHER & CHILD HOSPITAL', '2025-08-14', 0);
    END

    -- Invoice: IN156877
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156877' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156877', 'HEALTH TSHWANE REGION C', '2025-08-14', 0);
    END

    -- Invoice: IN156891
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156891' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156891', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-15', 0);
    END

    -- Invoice: IN156890
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156890' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156890', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-15', 0);
    END

    -- Invoice: IN156934
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156934' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156934', 'EC HEALTH BCM DISTR HUB', '2025-08-15', 0);
    END

    -- Invoice: IN156936
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156936' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156936', 'MANKWENG HOSPITAL PHARMACY', '2025-08-16', 0);
    END

    -- Invoice: IN156937
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156937' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156937', 'MANKWENG HOSPITAL PHARMACY', '2025-08-16', 0);
    END

    -- Invoice: IN156982
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156982' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156982', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-18', 0);
    END

    -- Invoice: IN156983
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156983' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156983', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-18', 0);
    END

    -- Invoice: IN156984
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156984' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156984', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-18', 0);
    END

    -- Invoice: IN156985
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156985' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156985', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-18', 0);
    END

    -- Invoice: IN156978
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156978' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156978', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-18', 0);
    END

    -- Invoice: IN156979
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156979' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156979', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-18', 0);
    END

    -- Invoice: IN156980
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156980' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156980', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-18', 0);
    END

    -- Invoice: IN156981
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156981' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156981', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-18', 0);
    END

    -- Invoice: IN156986
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156986' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156986', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-18', 0);
    END

    -- Invoice: IN156950
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156950' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156950', 'TAMBO MEMORIAL HOSPITAL', '2025-08-18', 0);
    END

    -- Invoice: IN156977
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156977' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156977', 'WESKOPPIES HOSPITAL', '2025-08-18', 0);
    END

    -- Invoice: IN156987
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN156987' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN156987', 'EDENVALE GENERAL HOSPITAL', '2025-08-18', 0);
    END

    -- Invoice: IN157133
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157133' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157133', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-19', 0);
    END

    -- Invoice: IN157134
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157134' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157134', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-19', 0);
    END

    -- Invoice: IN157131
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157131' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157131', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-19', 0);
    END

    -- Invoice: IN157132
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157132' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157132', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-19', 0);
    END

    -- Invoice: IN157199
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157199' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157199', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-20', 0);
    END

    -- Invoice: IN157198
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157198' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157198', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-20', 0);
    END

    -- Invoice: IN157235
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157235' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157235', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-21', 0);
    END

    -- Invoice: IN157234
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157234' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157234', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-21', 0);
    END

    -- Invoice: IN157236
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157236' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157236', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-21', 0);
    END

    -- Invoice: IN157262
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157262' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157262', 'TSHWANE REHABILITATION CENTRE', '2025-08-21', 0);
    END

    -- Invoice: IN157237
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157237' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157237', 'WESTONARIA SUB DISTRICT', '2025-08-21', 0);
    END

    -- Invoice: IN157264
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157264' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157264', 'EKURHULENI HEALTH DISTRICT', '2025-08-21', 0);
    END

    -- Invoice: IN157265
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157265' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157265', 'MP HEALTH ROB FERREIRA HOSPITAL', '2025-08-21', 0);
    END

    -- Invoice: IN157263
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157263' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157263', 'MP HEALTH THEMBA HOSPITAL', '2025-08-21', 0);
    END

    -- Invoice: IN157271
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157271' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157271', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-22', 0);
    END

    -- Invoice: IN157272
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157272' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157272', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-22', 0);
    END

    -- Invoice: IN157273
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157273' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157273', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-22', 0);
    END

    -- Invoice: IN157274
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157274' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157274', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-22', 0);
    END

    -- Invoice: IN157268
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157268' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157268', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-22', 0);
    END

    -- Invoice: IN157270
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157270' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157270', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-22', 0);
    END

    -- Invoice: IN157323
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157323' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157323', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-25', 0);
    END

    -- Invoice: IN157324
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157324' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157324', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-25', 0);
    END

    -- Invoice: IN157325
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157325' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157325', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-25', 0);
    END

    -- Invoice: IN157326
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157326' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157326', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-25', 0);
    END

    -- Invoice: IN157327
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157327' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157327', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-25', 0);
    END

    -- Invoice: IN157329
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157329' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157329', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-25', 0);
    END

    -- Invoice: IN157328
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157328' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157328', 'UTHUKELA DISTRICT OFFICE', '2025-08-25', 0);
    END

    -- Invoice: IN157362
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157362' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157362', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2025-08-25', 0);
    END

    -- Invoice: IN157361
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157361' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157361', 'BHEKI MLANGENI DISTRICT HOSPITAL', '2025-08-25', 0);
    END

    -- Invoice: IN157360
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157360' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157360', 'RAHIMA MOOSA MOTHER & CHILD HOSPITAL', '2025-08-25', 0);
    END

    -- Invoice: IN157359
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157359' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157359', 'TEMBISA HOSPITAL', '2025-08-25', 0);
    END

    -- Invoice: IN157331
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157331' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157331', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-08-25', 0);
    END

    -- Invoice: IN157330
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157330' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157330', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-08-25', 0);
    END

    -- Invoice: IN157370
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157370' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157370', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-26', 0);
    END

    -- Invoice: IN157480
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157480' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157480', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-26', 0);
    END

    -- Invoice: IN157368
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157368' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157368', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-26', 0);
    END

    -- Invoice: IN157369
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157369' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157369', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-26', 0);
    END

    -- Invoice: IN157481
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157481' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157481', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-26', 0);
    END

    -- Invoice: IN157482
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157482' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157482', 'FS HEALTH ELIZABETH ROSS HOSPITAL', '2025-08-27', 0);
    END

    -- Invoice: IN157609
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157609' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157609', 'GAUTENG EMERGENCY SERVICES', '2025-08-27', 0);
    END

    -- Invoice: IN157725
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157725' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157725', 'E.G & USHER MEMORAIL HOSPITAL', '2025-08-28', 0);
    END

    -- Invoice: IN157726
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157726' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157726', 'ESTCOURT HOSPITAL', '2025-08-28', 0);
    END

    -- Invoice: IN157722
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157722' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157722', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-28', 0);
    END

    -- Invoice: IN157723
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157723' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157723', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-28', 0);
    END

    -- Invoice: IN157724
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157724' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157724', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-28', 0);
    END

    -- Invoice: IN157721
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157721' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157721', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-28', 0);
    END

    -- Invoice: IN157727
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157727' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157727', 'FS HEALTH NATIONAL HOSPITAL', '2025-08-28', 0);
    END

    -- Invoice: IN157728
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157728' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157728', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2025-08-28', 0);
    END

    -- Invoice: IN157720
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157720' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157720', 'BHEKI MLANGENI DISTRICT HOSPITAL', '2025-08-28', 0);
    END

    -- Invoice: IN157794
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157794' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157794', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-29', 0);
    END

    -- Invoice: IN157795
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157795' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157795', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-08-29', 0);
    END

    -- Invoice: IN157895
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157895' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157895', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-09-01', 0);
    END

    -- Invoice: IN157897
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157897' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157897', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-09-01', 0);
    END

    -- Invoice: IN157896
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157896' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157896', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-09-01', 0);
    END

    -- Invoice: IN157898
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157898' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157898', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-09-01', 0);
    END

    -- Invoice: IN157894
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157894' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157894', 'MANKWENG HOSPITAL PHARMACY', '2025-09-01', 0);
    END

    -- Invoice: IN157873
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157873' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157873', 'THELLE MOGOERANE HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157874
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157874' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157874', 'HILLBROW CHC', '2025-09-01', 0);
    END

    -- Invoice: IN157868
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157868' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157868', 'DR. GEORGE MUKHARI HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157869
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157869' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157869', 'DR. GEORGE MUKHARI HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157887
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157887' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157887', 'FAR EAST RAND HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157888
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157888' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157888', 'FAR EAST RAND HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157879
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157879' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157879', 'BHEKI MLANGENI DISTRICT HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157878
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157878' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157878', 'KALAFONG HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157867
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157867' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157867', 'CHARLOTTE MAXEKE HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157885
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157885' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157885', 'CHARLOTTE MAXEKE HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157871
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157871' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157871', 'KOPANONG HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157870
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157870' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157870', 'SOUTH RAND HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157883
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157883' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157883', 'GERMISTON HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157893
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157893' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157893', 'RAHIMA MOOSA MOTHER & CHILD HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157876
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157876' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157876', 'HELEN JOSEPH HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157875
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157875' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157875', 'HELEN JOSEPH HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157866
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157866' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157866', 'TAMBO MEMORIAL HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157880
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157880' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157880', 'TAMBO MEMORIAL HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157872
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157872' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157872', 'MAMELODI HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157886
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157886' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157886', 'PRETORIA WEST HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157884
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157884' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157884', 'SEBOKENG HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157892
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157892' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157892', 'TEMBISA HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157890
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157890' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157890', 'STEVE BIKO ACADEMIC HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157891
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157891' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157891', 'STEVE BIKO ACADEMIC HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157889
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157889' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157889', 'HEALTH TSHWANE REGION C', '2025-09-01', 0);
    END

    -- Invoice: IN157877
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157877' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157877', 'TSHWANE DISTRICT HOSPITAL', '2025-09-01', 0);
    END

    -- Invoice: IN157882
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157882' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157882', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-09-01', 0);
    END

    -- Invoice: IN157881
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157881' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157881', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-09-01', 0);
    END

    -- Invoice: IN157947
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157947' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157947', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157948
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157948' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157948', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157949
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157949' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157949', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157950
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157950' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157950', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157951
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157951' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157951', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157946
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157946' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157946', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-09-02', 0);
    END

    -- Invoice: IN157919
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157919' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157919', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157920
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157920' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157920', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157923
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157923' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157923', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157924
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157924' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157924', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157925
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157925' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157925', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157927
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157927' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157927', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157929
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157929' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157929', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157933
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157933' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157933', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157921
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157921' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157921', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157922
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157922' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157922', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157926
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157926' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157926', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157928
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157928' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157928', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157930
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157930' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157930', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157931
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157931' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157931', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157934
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157934' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157934', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157935
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157935' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157935', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-02', 0);
    END

    -- Invoice: IN157932
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN157932' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN157932', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2025-09-02', 0);
    END

    -- Invoice: IN158033
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158033' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158033', 'NKOJENI HOSPITAL', '2025-09-03', 0);
    END

    -- Invoice: IN158030
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158030' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158030', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-03', 0);
    END

    -- Invoice: IN158031
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158031' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158031', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-03', 0);
    END

    -- Invoice: IN158032
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158032' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158032', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-03', 0);
    END

    -- Invoice: IN158027
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158027' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158027', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-03', 0);
    END

    -- Invoice: IN158028
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158028' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158028', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-03', 0);
    END

    -- Invoice: IN158069
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158069' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158069', 'LADYSMITH REGIONAL HOSPITAL', '2025-09-04', 0);
    END

    -- Invoice: IN158062
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158062' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158062', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-04', 0);
    END

    -- Invoice: IN158065
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158065' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158065', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-04', 0);
    END

    -- Invoice: IN158064
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158064' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158064', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-04', 0);
    END

    -- Invoice: IN158067
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158067' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158067', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-04', 0);
    END

    -- Invoice: IN158068
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158068' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158068', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-04', 0);
    END

    -- Invoice: IN158063
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158063' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158063', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-04', 0);
    END

    -- Invoice: IN158151
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158151' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158151', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-08', 0);
    END

    -- Invoice: IN158153
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158153' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158153', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-08', 0);
    END

    -- Invoice: IN158157
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158157' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158157', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-08', 0);
    END

    -- Invoice: IN158159
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158159' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158159', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-08', 0);
    END

    -- Invoice: IN158149
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158149' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158149', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-08', 0);
    END

    -- Invoice: IN158155
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158155' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158155', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-08', 0);
    END

    -- Invoice: IN158145
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158145' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158145', 'BAHLABANI PHARMACY', '2025-09-08', 0);
    END

    -- Invoice: IN158144
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158144' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158144', 'BORELELO WELL-MED SURGERY', '2025-09-08', 0);
    END

    -- Invoice: IN158172
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158172' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158172', 'GAUTENG EMERGENCY SERVICES', '2025-09-08', 0);
    END

    -- Invoice: IN158226
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158226' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158226', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-09', 0);
    END

    -- Invoice: IN158227
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158227' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158227', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-09', 0);
    END

    -- Invoice: IN158222
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158222' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158222', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-09', 0);
    END

    -- Invoice: IN158223
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158223' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158223', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-09', 0);
    END

    -- Invoice: IN158224
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158224' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158224', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-09', 0);
    END

    -- Invoice: IN158225
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158225' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158225', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-09', 0);
    END

    -- Invoice: IN158233
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158233' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158233', 'DINGHA SAMA', '2025-09-09', 0);
    END

    -- Invoice: IN158235
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158235' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158235', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158237
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158237' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158237', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158238
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158238' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158238', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158239
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158239' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158239', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158240
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158240' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158240', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158241
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158241' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158241', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158242
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158242' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158242', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158243
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158243' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158243', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158244
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158244' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158244', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158251
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158251' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158251', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158245
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158245' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158245', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158246
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158246' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158246', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158247
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158247' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158247', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158248
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158248' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158248', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158249
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158249' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158249', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-10', 0);
    END

    -- Invoice: IN158306
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158306' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158306', 'FS HEALTH BOTSHABELO HOSPITAL', '2025-09-10', 0);
    END

    -- Invoice: IN158236
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158236' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158236', 'DR. GEORGE MUKHARI HOSPITAL', '2025-09-10', 0);
    END

    -- Invoice: IN158250
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158250' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158250', 'CHARLOTTE MAXEKE HOSPITAL', '2025-09-10', 0);
    END

    -- Invoice: IN158365
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158365' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158365', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-11', 0);
    END

    -- Invoice: IN158371
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158371' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158371', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-11', 0);
    END

    -- Invoice: IN158369
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158369' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158369', 'HILLBROW CHC', '2025-09-11', 0);
    END

    -- Invoice: IN158372
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158372' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158372', 'CHARLOTTE MAXEKE HOSPITAL', '2025-09-11', 0);
    END

    -- Invoice: IN158370
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158370' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158370', 'HELEN JOSEPH HOSPITAL', '2025-09-11', 0);
    END

    -- Invoice: IN158367
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158367' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158367', 'SEBOKENG HOSPITAL', '2025-09-11', 0);
    END

    -- Invoice: IN158373
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158373' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158373', 'WESTONARIA SUB DISTRICT', '2025-09-11', 0);
    END

    -- Invoice: IN158374
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158374' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158374', 'WESTONARIA SUB DISTRICT', '2025-09-11', 0);
    END

    -- Invoice: IN158376
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158376' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158376', 'WESTONARIA SUB DISTRICT', '2025-09-11', 0);
    END

    -- Invoice: IN158368
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158368' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158368', 'STEVE BIKO ACADEMIC HOSPITAL', '2025-09-11', 0);
    END

    -- Invoice: IN158366
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158366' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158366', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-09-11', 0);
    END

    -- Invoice: IN158375
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158375' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158375', 'DEPARTMENT OF HEALTH MPUMALANGA', '2025-09-11', 0);
    END

    -- Invoice: IN158406
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158406' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158406', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-12', 0);
    END

    -- Invoice: IN158421
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158421' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158421', 'FS HEALTH BOTSHABELO HOSPITAL', '2025-09-12', 0);
    END

    -- Invoice: IN158451
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158451' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158451', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-13', 0);
    END

    -- Invoice: IN158449
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158449' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158449', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-13', 0);
    END

    -- Invoice: IN158450
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158450' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158450', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-13', 0);
    END

    -- Invoice: IN158448
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158448' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158448', 'CHARLOTTE MAXEKE HOSPITAL', '2025-09-13', 0);
    END

    -- Invoice: IN158486
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158486' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158486', 'KALAFONG HOSPITAL', '2025-09-15', 0);
    END

    -- Invoice: IN158485
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158485' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158485', 'HEALTH TSHWANE REGION C', '2025-09-15', 0);
    END

    -- Invoice: IN158518
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158518' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158518', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-16', 0);
    END

    -- Invoice: IN158585
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158585' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158585', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-17', 0);
    END

    -- Invoice: IN158572
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158572' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158572', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-17', 0);
    END

    -- Invoice: IN158573
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158573' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158573', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-17', 0);
    END

    -- Invoice: IN158578
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158578' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158578', 'MERAFONG SUB DISTRICT', '2025-09-17', 0);
    END

    -- Invoice: IN158589
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158589' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158589', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-18', 0);
    END

    -- Invoice: IN158590
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158590' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158590', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-18', 0);
    END

    -- Invoice: IN158654
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158654' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158654', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-09-19', 0);
    END

    -- Invoice: IN158689
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158689' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158689', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-20', 0);
    END

    -- Invoice: IN158688
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158688' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158688', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-20', 0);
    END

    -- Invoice: IN158691
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158691' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158691', 'WESTONARIA SUB DISTRICT', '2025-09-20', 0);
    END

    -- Invoice: IN158728
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158728' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158728', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-22', 0);
    END

    -- Invoice: IN158729
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158729' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158729', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-22', 0);
    END

    -- Invoice: IN158730
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158730' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158730', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-22', 0);
    END

    -- Invoice: IN158731
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158731' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158731', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-22', 0);
    END

    -- Invoice: IN158732
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158732' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158732', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-22', 0);
    END

    -- Invoice: IN158733
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158733' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158733', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-22', 0);
    END

    -- Invoice: IN158734
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158734' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158734', 'UMZIMKULU PSYCHATRIC COMPLEX', '2025-09-22', 0);
    END

    -- Invoice: IN158735
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158735' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158735', 'HEALTH REGION B', '2025-09-22', 0);
    END

    -- Invoice: IN158799
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158799' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158799', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-23', 0);
    END

    -- Invoice: IN158798
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158798' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158798', 'WEST RAND HEALTH DISTRICT OFFICE', '2025-09-23', 0);
    END

    -- Invoice: IN158811
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158811' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158811', 'CORRECTIONAL SERVICE LEEUKOP', '2025-09-25', 0);
    END

    -- Invoice: IN158890
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158890' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158890', 'HILLBROW CHC', '2025-09-25', 0);
    END

    -- Invoice: IN158877
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158877' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158877', 'DR. GEORGE MUKHARI HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158810
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158810' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158810', 'ODI DISTRICT HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158886
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158886' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158886', 'FAR EAST RAND HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158876
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158876' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158876', 'KALAFONG HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158881
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158881' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158881', 'HEIDELBURG HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158887
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158887' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158887', 'SOUTH RAND HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158812
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158812' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158812', 'GERMISTON HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158882
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158882' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158882', 'DR. YUSUF DADOO HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158893
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158893' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158893', 'HELEN JOSEPH HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158892
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158892' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158892', 'TAMBO MEMORIAL HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158889
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158889' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158889', 'SEBOKENG HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158884
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158884' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158884', 'TEMBISA HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158880
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158880' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158880', 'MOGALE SUB DISTRICT', '2025-09-25', 0);
    END

    -- Invoice: IN158879
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158879' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158879', 'WESTONARIA SUB DISTRICT', '2025-09-25', 0);
    END

    -- Invoice: IN158885
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158885' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158885', 'STEVE BIKO ACADEMIC HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158924
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158924' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158924', 'EKURHULENI HEALTH DISTRICT', '2025-09-25', 0);
    END

    -- Invoice: IN158883
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158883' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158883', 'EKURHULENI HEALTH DISTRICT', '2025-09-25', 0);
    END

    -- Invoice: IN158878
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158878' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158878', 'HEALTH TSHWANE REGION C', '2025-09-25', 0);
    END

    -- Invoice: IN158891
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158891' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158891', 'TSHWANE DISTRICT HOSPITAL', '2025-09-25', 0);
    END

    -- Invoice: IN158813
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158813' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158813', 'WEST RAND HEALTH DISTRICT OFFICE', '2025-09-25', 0);
    END

    -- Invoice: IN158827
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158827' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158827', 'WEST RAND HEALTH DISTRICT OFFICE', '2025-09-25', 0);
    END

    -- Invoice: IN158888
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158888' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158888', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-09-25', 0);
    END

    -- Invoice: IN158928
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158928' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158928', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-26', 0);
    END

    -- Invoice: IN158929
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158929' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158929', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-26', 0);
    END

    -- Invoice: IN158930
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158930' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158930', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-26', 0);
    END

    -- Invoice: IN158931
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158931' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158931', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-26', 0);
    END

    -- Invoice: IN158932
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158932' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158932', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-26', 0);
    END

    -- Invoice: IN158933
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158933' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158933', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-26', 0);
    END

    -- Invoice: IN158934
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158934' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158934', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-26', 0);
    END

    -- Invoice: IN158935
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158935' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158935', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-26', 0);
    END

    -- Invoice: IN158936
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158936' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158936', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-26', 0);
    END

    -- Invoice: IN158963
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158963' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158963', 'SOUTH RAND HOSPITAL', '2025-09-26', 0);
    END

    -- Invoice: IN158961
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158961' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158961', 'HEALTH TSHWANE REGION C', '2025-09-26', 0);
    END

    -- Invoice: IN158962
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158962' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158962', 'GAUTENG EMERGENCY SERVICES', '2025-09-26', 0);
    END

    -- Invoice: IN158992
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158992' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158992', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-29', 0);
    END

    -- Invoice: IN158993
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158993' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158993', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-29', 0);
    END

    -- Invoice: IN158994
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158994' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158994', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-29', 0);
    END

    -- Invoice: IN158997
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN158997' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN158997', 'PROF NP SARAGAS', '2025-09-29', 0);
    END

    -- Invoice: IN159023
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159023' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159023', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-30', 0);
    END

    -- Invoice: IN159024
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159024' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159024', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-30', 0);
    END

    -- Invoice: IN159025
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159025' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159025', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-30', 0);
    END

    -- Invoice: IN159027
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159027' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159027', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-30', 0);
    END

    -- Invoice: IN159026
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159026' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159026', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-09-30', 0);
    END

    -- Invoice: IN159047
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159047' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159047', 'KALAFONG HOSPITAL', '2025-09-30', 0);
    END

    -- Invoice: IN159057
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159057' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159057', 'TSHWANE REHABILITATION CENTRE', '2025-10-01', 0);
    END

    -- Invoice: IN159093
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159093' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159093', 'WEST RAND HEALTH DISTRICT OFFICE', '2025-10-01', 0);
    END

    -- Invoice: IN159139
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159139' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159139', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-02', 0);
    END

    -- Invoice: IN159140
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159140' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159140', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-02', 0);
    END

    -- Invoice: IN159141
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159141' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159141', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-02', 0);
    END

    -- Invoice: IN159152
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159152' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159152', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-03', 0);
    END

    -- Invoice: IN159151
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159151' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159151', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-03', 0);
    END

    -- Invoice: IN159153
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159153' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159153', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-03', 0);
    END

    -- Invoice: IN159154
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159154' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159154', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2025-10-03', 0);
    END

    -- Invoice: IN159194
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159194' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159194', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2025-10-06', 0);
    END

    -- Invoice: IN159233
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159233' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159233', 'GERMISTON HOSPITAL', '2025-10-06', 0);
    END

    -- Invoice: IN159234
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159234' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159234', 'DEPARTMENT OF HEALTH AMAJUBA DISTRICT', '2025-10-07', 0);
    END

    -- Invoice: IN159237
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159237' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159237', 'MADADENI HOSPITAL', '2025-10-07', 0);
    END

    -- Invoice: IN159238
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159238' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159238', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-07', 0);
    END

    -- Invoice: IN159242
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159242' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159242', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-07', 0);
    END

    -- Invoice: IN159267
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159267' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159267', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-07', 0);
    END

    -- Invoice: IN159272
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159272' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159272', 'FS HEALTH UNIVERSITAS HOSPITAL', '2025-10-07', 0);
    END

    -- Invoice: IN159268
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159268' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159268', 'HEALTH TSHWANE REGION C', '2025-10-07', 0);
    END

    -- Invoice: IN159236
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159236' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159236', 'HEALTH REGION B', '2025-10-07', 0);
    END

    -- Invoice: IN159235
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159235' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159235', 'HEALTH REGION B', '2025-10-07', 0);
    END

    -- Invoice: IN159310
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159310' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159310', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159311
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159311' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159311', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159312
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159312' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159312', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159314
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159314' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159314', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159315
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159315' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159315', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159317
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159317' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159317', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159319
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159319' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159319', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159320
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159320' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159320', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159323
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159323' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159323', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159324
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159324' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159324', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159326
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159326' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159326', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159327
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159327' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159327', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159329
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159329' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159329', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-08', 0);
    END

    -- Invoice: IN159418
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159418' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159418', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-09', 0);
    END

    -- Invoice: IN159417
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159417' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159417', 'GAUTENG EMERGENCY SERVICES', '2025-10-09', 0);
    END

    -- Invoice: IN159465
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159465' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159465', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-13', 0);
    END

    -- Invoice: IN159462
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159462' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159462', 'PIETERSBURG HOSPITAL PHARMACY', '2025-10-13', 0);
    END

    -- Invoice: IN159461
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159461' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159461', 'PIETERSBURG HOSPITAL PHARMACY', '2025-10-13', 0);
    END

    -- Invoice: IN159464
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159464' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159464', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2025-10-13', 0);
    END

    -- Invoice: IN159463
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159463' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159463', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2025-10-13', 0);
    END

    -- Invoice: IN159460
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159460' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159460', 'FAR EAST RAND HOSPITAL', '2025-10-13', 0);
    END

    -- Invoice: IN159459
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159459' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159459', 'TAMBO MEMORIAL HOSPITAL', '2025-10-13', 0);
    END

    -- Invoice: IN159555
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159555' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159555', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-14', 0);
    END

    -- Invoice: IN159613
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159613' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159613', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-15', 0);
    END

    -- Invoice: IN159614
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159614' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159614', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-15', 0);
    END

    -- Invoice: IN159605
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159605' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159605', 'FS HEALTH UNIVERSITAS HOSPITAL', '2025-10-15', 0);
    END

    -- Invoice: IN159691
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159691' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159691', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-17', 0);
    END

    -- Invoice: IN159717
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159717' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159717', 'MOGALE SUB DISTRICT', '2025-10-20', 0);
    END

    -- Invoice: IN159784
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159784' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159784', 'HLENGISIZWE CHC', '2025-10-22', 0);
    END

    -- Invoice: IN159772
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159772' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159772', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159773
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159773' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159773', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159774
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159774' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159774', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159775
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159775' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159775', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159776
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159776' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159776', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159777
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159777' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159777', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159778
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159778' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159778', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159779
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159779' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159779', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159780
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159780' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159780', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159781
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159781' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159781', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159782
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159782' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159782', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159783
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159783' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159783', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159785
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159785' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159785', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159786
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159786' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159786', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159787
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159787' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159787', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-22', 0);
    END

    -- Invoice: IN159799
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159799' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159799', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-10-23', 0);
    END

    -- Invoice: IN159806
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159806' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159806', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-10-23', 0);
    END

    -- Invoice: IN159810
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159810' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159810', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-10-23', 0);
    END

    -- Invoice: IN159823
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159823' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159823', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-10-23', 0);
    END

    -- Invoice: IN159824
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159824' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159824', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-10-23', 0);
    END

    -- Invoice: IN159825
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159825' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159825', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-10-23', 0);
    END

    -- Invoice: IN159831
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159831' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159831', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-10-23', 0);
    END

    -- Invoice: IN159835
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159835' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159835', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-10-23', 0);
    END

    -- Invoice: IN159792
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159792' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159792', 'PIETERSBURG HOSPITAL PHARMACY', '2025-10-23', 0);
    END

    -- Invoice: IN159816
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159816' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159816', 'PIETERSBURG HOSPITAL PHARMACY', '2025-10-23', 0);
    END

    -- Invoice: IN159790
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159790' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159790', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159794
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159794' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159794', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159795
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159795' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159795', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159796
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159796' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159796', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159797
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159797' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159797', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159802
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159802' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159802', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159853
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159853' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159853', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159813
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159813' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159813', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159817
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159817' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159817', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159819
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159819' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159819', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159820
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159820' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159820', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159821
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159821' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159821', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159822
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159822' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159822', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159836
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159836' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159836', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159837
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159837' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159837', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-23', 0);
    END

    -- Invoice: IN159798
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159798' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159798', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2025-10-23', 0);
    END

    -- Invoice: IN159801
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159801' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159801', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2025-10-23', 0);
    END

    -- Invoice: IN159807
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159807' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159807', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2025-10-23', 0);
    END

    -- Invoice: IN159834
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159834' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159834', 'HILLBROW CHC', '2025-10-23', 0);
    END

    -- Invoice: IN159833
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159833' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159833', 'DR. GEORGE MUKHARI HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159830
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159830' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159830', 'FAR EAST RAND HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159805
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159805' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159805', 'BHEKI MLANGENI DISTRICT HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159828
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159828' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159828', 'KALAFONG HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159791
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159791' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159791', 'KOPANONG HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159815
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159815' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159815', 'KOPANONG HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159809
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159809' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159809', 'SOUTH RAND HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159829
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159829' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159829', 'HELEN JOSEPH HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159789
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159789' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159789', 'LERATONG HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159838
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159838' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159838', 'JUBILEE DISTRICT HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159832
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159832' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159832', 'SEBOKENG HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159818
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159818' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159818', 'TEMBISA HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159788
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159788' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159788', 'STEVE BIKO ACADEMIC HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159812
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159812' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159812', 'STEVE BIKO ACADEMIC HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159826
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159826' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159826', 'EKURHULENI HEALTH DISTRICT', '2025-10-23', 0);
    END

    -- Invoice: IN159803
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159803' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159803', 'HEALTH REGION B', '2025-10-23', 0);
    END

    -- Invoice: IN159827
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159827' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159827', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-10-23', 0);
    END

    -- Invoice: IN159811
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159811' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159811', 'MP HEALTH BERNICE SAMUEL HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159808
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159808' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159808', 'MP HEALTH ERMELO HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159800
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159800' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159800', 'MP HEALTH EVANDER HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159793
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159793' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159793', 'MP HEALTH MMAMATLHAKE HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159814
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159814' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159814', 'MP HEALTH WITBANK HOSPITAL', '2025-10-23', 0);
    END

    -- Invoice: IN159872
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159872' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159872', 'KEVIN MYNHARDT', '2025-10-24', 0);
    END

    -- Invoice: IN159879
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159879' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159879', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159880
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159880' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159880', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159881
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159881' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159881', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159883
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159883' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159883', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159890
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159890' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159890', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159891
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159891' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159891', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159892
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159892' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159892', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159893
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159893' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159893', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159897
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159897' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159897', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159898
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159898' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159898', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159899
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159899' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159899', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159900
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159900' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159900', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159901
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159901' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159901', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159902
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159902' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159902', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159903
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159903' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159903', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159904
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159904' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159904', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159905
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159905' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159905', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159906
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159906' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159906', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159907
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159907' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159907', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159882
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159882' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159882', 'MANKWENG HOSPITAL PHARMACY', '2025-10-24', 0);
    END

    -- Invoice: IN159876
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159876' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159876', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159877
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159877' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159877', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159878
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159878' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159878', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159894
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159894' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159894', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159895
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159895' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159895', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159896
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159896' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159896', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-24', 0);
    END

    -- Invoice: IN159874
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159874' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159874', 'FS HEALTH TOKOLLO COMPLEX', '2025-10-24', 0);
    END

    -- Invoice: IN159875
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159875' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159875', 'HEALTH REGION B', '2025-10-24', 0);
    END

    -- Invoice: IN159937
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159937' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159937', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-27', 0);
    END

    -- Invoice: IN159938
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159938' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159938', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-27', 0);
    END

    -- Invoice: IN159939
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159939' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159939', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-27', 0);
    END

    -- Invoice: IN159955
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159955' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159955', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-28', 0);
    END

    -- Invoice: IN159956
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159956' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159956', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-28', 0);
    END

    -- Invoice: IN159954
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159954' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159954', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-10-28', 0);
    END

    -- Invoice: IN159957
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN159957' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN159957', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-28', 0);
    END

    -- Invoice: IN160040
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160040' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160040', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-31', 0);
    END

    -- Invoice: IN160043
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160043' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160043', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-31', 0);
    END

    -- Invoice: IN160045
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160045' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160045', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-31', 0);
    END

    -- Invoice: IN160046
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160046' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160046', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-31', 0);
    END

    -- Invoice: IN160047
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160047' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160047', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-31', 0);
    END

    -- Invoice: IN160041
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160041' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160041', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-31', 0);
    END

    -- Invoice: IN160051
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160051' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160051', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-31', 0);
    END

    -- Invoice: IN160042
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160042' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160042', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-31', 0);
    END

    -- Invoice: IN160049
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160049' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160049', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-10-31', 0);
    END

    -- Invoice: IN160050
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160050' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160050', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-10-31', 0);
    END

    -- Invoice: IN160048
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160048' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160048', 'RAHIMA MOOSA MOTHER & CHILD HOSPITAL', '2025-10-31', 0);
    END

    -- Invoice: IN160053
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160053' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160053', 'HELEN JOSEPH HOSPITAL', '2025-10-31', 0);
    END

    -- Invoice: IN160052
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160052' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160052', 'TEMBISA HOSPITAL', '2025-10-31', 0);
    END

    -- Invoice: IN160039
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160039' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160039', 'MP HEALTH TINTSWALO HOSPITAL', '2025-10-31', 0);
    END

    -- Invoice: IN160129
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160129' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160129', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160124
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160124' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160124', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160125
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160125' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160125', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160127
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160127' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160127', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160111
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160111' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160111', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160112
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160112' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160112', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160114
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160114' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160114', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160115
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160115' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160115', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160116
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160116' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160116', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160117
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160117' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160117', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160120
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160120' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160120', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160121
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160121' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160121', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160113
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160113' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160113', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-11-01', 0);
    END

    -- Invoice: IN160123
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160123' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160123', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160118
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160118' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160118', 'FS HEALTH NATIONAL HOSPITAL', '2025-11-01', 0);
    END

    -- Invoice: IN160122
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160122' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160122', 'FS HEALTH PELONOMI HOSPITAL', '2025-11-01', 0);
    END

    -- Invoice: IN160126
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160126' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160126', 'WESTERN CAPE PHARMACEUTICAL DEPOT', '2025-11-01', 0);
    END

    -- Invoice: IN160110
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160110' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160110', 'RAHIMA MOOSA MOTHER & CHILD HOSPITAL', '2025-11-01', 0);
    END

    -- Invoice: IN160109
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160109' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160109', 'HEALTH REGION B', '2025-11-01', 0);
    END

    -- Invoice: IN160128
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160128' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160128', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-11-01', 0);
    END

    -- Invoice: IN160119
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160119' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160119', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-11-01', 0);
    END

    -- Invoice: IN160130
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160130' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160130', 'MP HEALTH TINTSWALO HOSPITAL', '2025-11-01', 0);
    END

    -- Invoice: IN160217
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160217' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160217', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-03', 0);
    END

    -- Invoice: IN160178
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160178' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160178', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-03', 0);
    END

    -- Invoice: IN160219
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160219' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160219', 'MERAFONG SUB DISTRICT', '2025-11-03', 0);
    END

    -- Invoice: IN160216
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160216' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160216', 'MP HEALTH TINTSWALO HOSPITAL', '2025-11-03', 0);
    END

    -- Invoice: IN160331
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160331' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160331', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-05', 0);
    END

    -- Invoice: IN160330
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160330' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160330', 'DEPARTMENT OF HEALTH MPUMALANGA', '2025-11-05', 0);
    END

    -- Invoice: IN160460
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160460' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160460', 'FS HEALTH MANGAUNG METRO DIST OFFICE', '2025-11-10', 0);
    END

    -- Invoice: IN160497
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160497' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160497', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160498
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160498' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160498', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160492
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160492' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160492', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160493
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160493' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160493', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160494
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160494' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160494', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160495
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160495' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160495', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160496
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160496' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160496', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160499
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160499' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160499', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160500
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160500' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160500', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160501
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160501' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160501', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160503
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160503' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160503', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160504
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160504' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160504', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160507
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160507' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160507', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160502
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160502' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160502', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160509
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160509' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160509', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-11', 0);
    END

    -- Invoice: IN160506
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160506' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160506', 'FS HEALTH PHEKOLONG HOSPITAL', '2025-11-11', 0);
    END

    -- Invoice: IN160505
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160505' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160505', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-11-11', 0);
    END

    -- Invoice: IN160511
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160511' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160511', 'DEPARTMENT OF HEALTH MPUMALANGA', '2025-11-11', 0);
    END

    -- Invoice: IN160510
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160510' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160510', 'DEPARTMENT OF HEALTH MPUMALANGA', '2025-11-11', 0);
    END

    -- Invoice: IN160508
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160508' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160508', 'MP HEALTH EVANDER HOSPITAL', '2025-11-11', 0);
    END

    -- Invoice: IN160556
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160556' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160556', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-12', 0);
    END

    -- Invoice: IN160557
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160557' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160557', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-12', 0);
    END

    -- Invoice: IN160554
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160554' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160554', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-12', 0);
    END

    -- Invoice: IN160555
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160555' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160555', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-12', 0);
    END

    -- Invoice: IN160551
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160551' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160551', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-12', 0);
    END

    -- Invoice: IN160553
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160553' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160553', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-12', 0);
    END

    -- Invoice: IN160558
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160558' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160558', 'FS HEALTH PHEKOLONG HOSPITAL', '2025-11-12', 0);
    END

    -- Invoice: IN160559
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160559' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160559', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2025-11-12', 0);
    END

    -- Invoice: IN160552
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160552' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160552', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-11-12', 0);
    END

    -- Invoice: IN160562
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160562' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160562', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-11-12', 0);
    END

    -- Invoice: IN160560
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160560' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160560', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-11-12', 0);
    END

    -- Invoice: IN160561
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160561' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160561', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-11-12', 0);
    END

    -- Invoice: IN160538
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160538' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160538', 'MP HEALTH HQ', '2025-11-12', 0);
    END

    -- Invoice: IN160537
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160537' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160537', 'MP HEALTH HQ', '2025-11-12', 0);
    END

    -- Invoice: IN160550
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160550' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160550', 'MP HEALTH TINTSWALO HOSPITAL', '2025-11-12', 0);
    END

    -- Invoice: IN160596
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160596' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160596', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-13', 0);
    END

    -- Invoice: IN160597
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160597' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160597', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-13', 0);
    END

    -- Invoice: IN160598
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160598' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160598', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-13', 0);
    END

    -- Invoice: IN160600
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160600' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160600', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-13', 0);
    END

    -- Invoice: IN160599
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160599' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160599', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-13', 0);
    END

    -- Invoice: IN160595
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160595' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160595', 'HEALTH REGION B', '2025-11-13', 0);
    END

    -- Invoice: IN160730
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160730' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160730', 'MRS ALISON BUDGE', '2025-11-20', 0);
    END

    -- Invoice: IN160851
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160851' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160851', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-21', 0);
    END

    -- Invoice: IN160852
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160852' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160852', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-21', 0);
    END

    -- Invoice: IN160853
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160853' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160853', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-21', 0);
    END

    -- Invoice: IN160933
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160933' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160933', 'NSELENI COMMUNITY HEALTH CENTRE', '2025-11-25', 0);
    END

    -- Invoice: IN160915
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160915' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160915', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160916
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160916' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160916', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160917
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160917' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160917', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160918
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160918' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160918', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160919
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160919' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160919', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160921
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160921' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160921', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160922
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160922' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160922', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160923
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160923' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160923', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160924
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160924' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160924', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160910
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160910' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160910', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160911
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160911' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160911', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160912
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160912' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160912', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160913
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160913' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160913', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160925
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160925' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160925', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160926
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160926' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160926', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160927
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160927' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160927', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160928
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160928' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160928', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160929
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160929' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160929', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160930
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160930' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160930', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160931
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160931' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160931', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160932
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160932' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160932', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160934
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160934' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160934', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160935
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160935' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160935', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160936
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160936' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160936', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160914
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160914' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160914', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160920
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160920' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160920', 'ZULULAND HEALTH DISTRICT OFFICE', '2025-11-25', 0);
    END

    -- Invoice: IN160970
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160970' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160970', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-11-25', 0);
    END

    -- Invoice: IN160969
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160969' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160969', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-11-25', 0);
    END

    -- Invoice: IN160957
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160957' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160957', 'BOPHELONG PSYCHIATRIC HOSPITAL', '2025-11-25', 0);
    END

    -- Invoice: IN160968
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160968' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160968', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160965
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160965' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160965', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160967
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160967' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160967', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-11-25', 0);
    END

    -- Invoice: IN160964
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160964' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160964', 'FS HEALTH BONGANI REGIONAL HOSPITAL', '2025-11-25', 0);
    END

    -- Invoice: IN160966
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160966' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160966', 'DR. GEORGE MUKHARI HOSPITAL', '2025-11-25', 0);
    END

    -- Invoice: IN160939
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160939' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160939', 'MERAFONG SUB DISTRICT', '2025-11-25', 0);
    END

    -- Invoice: IN160958
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160958' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160958', 'STEVE BIKO ACADEMIC HOSPITAL', '2025-11-25', 0);
    END

    -- Invoice: IN160963
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160963' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160963', 'STEVE BIKO ACADEMIC HOSPITAL', '2025-11-25', 0);
    END

    -- Invoice: IN160960
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160960' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160960', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-11-25', 0);
    END

    -- Invoice: IN160959
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160959' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160959', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-11-25', 0);
    END

    -- Invoice: IN160961
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160961' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160961', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-11-25', 0);
    END

    -- Invoice: IN160962
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN160962' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN160962', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-11-25', 0);
    END

    -- Invoice: IN161014
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161014' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161014', 'FS HEALTH MOFUMAHADI MANAPO HOSPITAL', '2025-11-27', 0);
    END

    -- Invoice: IN161013
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161013' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161013', 'MAMELODI HOSPITAL', '2025-11-27', 0);
    END

    -- Invoice: IN161052
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161052' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161052', 'DEPARTMENT OF HEALTH NORTH WEST', '2025-11-28', 0);
    END

    -- Invoice: IN161053
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161053' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161053', 'DEPARTMENT OF HEALTH NORTH WEST', '2025-11-28', 0);
    END

    -- Invoice: IN161128
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161128' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161128', 'MOGALE SUB DISTRICT', '2025-12-01', 0);
    END

    -- Invoice: IN161133
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161133' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161133', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161137
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161137' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161137', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161138
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161138' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161138', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161139
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161139' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161139', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161140
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161140' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161140', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161141
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161141' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161141', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161142
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161142' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161142', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161143
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161143' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161143', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161148
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161148' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161148', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161134
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161134' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161134', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161135
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161135' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161135', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161145
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161145' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161145', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161146
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161146' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161146', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161136
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161136' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161136', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161144
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161144' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161144', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161147
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161147' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161147', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161152
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161152' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161152', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-12-02', 0);
    END

    -- Invoice: IN161150
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161150' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161150', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-02', 0);
    END

    -- Invoice: IN161151
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161151' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161151', 'FS HEALTH BONGANI REGIONAL HOSPITAL', '2025-12-02', 0);
    END

    -- Invoice: IN161149
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161149' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161149', 'SIZWE TROPICAL DISEASE HOSPITAL', '2025-12-02', 0);
    END

    -- Invoice: IN161213
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161213' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161213', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-04', 0);
    END

    -- Invoice: IN161234
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161234' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161234', 'HEALTH REGION B', '2025-12-04', 0);
    END

    -- Invoice: IN161252
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161252' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161252', 'PIETERSBURG HOSPITAL PHARMACY', '2025-12-05', 0);
    END

    -- Invoice: IN161260
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161260' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161260', 'CORRECTIONAL SERVICE GOODWOOD', '2025-12-08', 0);
    END

    -- Invoice: IN161261
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161261' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161261', 'WESTERN CAPE PHARMACEUTICAL DEPOT', '2025-12-08', 0);
    END

    -- Invoice: IN161283
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161283' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161283', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-09', 0);
    END

    -- Invoice: IN161313
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161313' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161313', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-10', 0);
    END

    -- Invoice: IN161316
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161316' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161316', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-10', 0);
    END

    -- Invoice: IN161315
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161315' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161315', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-10', 0);
    END

    -- Invoice: IN161314
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161314' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161314', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-10', 0);
    END

    -- Invoice: IN161312
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161312' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161312', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-10', 0);
    END

    -- Invoice: IN161360
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161360' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161360', 'FS HEALTH TOKOLLO COMPLEX', '2025-12-10', 0);
    END

    -- Invoice: IN161317
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161317' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161317', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-12-10', 0);
    END

    -- Invoice: IN161311
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161311' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161311', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-12-10', 0);
    END

    -- Invoice: IN161514
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161514' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161514', 'MP HEALTH HQ', '2025-12-17', 0);
    END

    -- Invoice: IN161532
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161532' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161532', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-12-18', 0);
    END

    -- Invoice: IN161587
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161587' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161587', 'CORRECTIONAL SERVICE PIETERMARITZBURG', '2025-12-23', 0);
    END

    -- Invoice: IN161596
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161596' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161596', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161598
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161598' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161598', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161602
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161602' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161602', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161610
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161610' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161610', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161611
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161611' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161611', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161612
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161612' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161612', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161613
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161613' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161613', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161614
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161614' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161614', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161619
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161619' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161619', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161621
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161621' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161621', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161622
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161622' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161622', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161623
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161623' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161623', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161624
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161624' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161624', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161625
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161625' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161625', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161626
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161626' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161626', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161581
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161581' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161581', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161582
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161582' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161582', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161583
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161583' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161583', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161584
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161584' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161584', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161585
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161585' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161585', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161586
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161586' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161586', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161588
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161588' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161588', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161589
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161589' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161589', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161590
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161590' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161590', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161591
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161591' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161591', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161592
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161592' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161592', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161593
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161593' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161593', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161594
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161594' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161594', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161595
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161595' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161595', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161597
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161597' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161597', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161599
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161599' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161599', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161600
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161600' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161600', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161601
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161601' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161601', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161603
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161603' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161603', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161604
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161604' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161604', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161605
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161605' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161605', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161606
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161606' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161606', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161607
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161607' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161607', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161608
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161608' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161608', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161609
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161609' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161609', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161615
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161615' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161615', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161616
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161616' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161616', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161617
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161617' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161617', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161618
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161618' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161618', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161620
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161620' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161620', 'PROVINCIAL PHARM SUPPLY DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161557
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161557' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161557', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-12-23', 0);
    END

    -- Invoice: IN161572
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161572' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161572', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-12-23', 0);
    END

    -- Invoice: IN161575
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161575' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161575', 'DEPARTMENT OF HEALTH LIMPOPO', '2025-12-23', 0);
    END

    -- Invoice: IN161573
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161573' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161573', 'MANKWENG HOSPITAL PHARMACY', '2025-12-23', 0);
    END

    -- Invoice: IN161574
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161574' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161574', 'MANKWENG HOSPITAL PHARMACY', '2025-12-23', 0);
    END

    -- Invoice: IN161580
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161580' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161580', 'DEPARTMENT OF HEALTH NORTH WEST', '2025-12-23', 0);
    END

    -- Invoice: IN161547
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161547' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161547', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161551
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161551' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161551', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161562
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161562' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161562', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161571
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161571' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161571', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161548
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161548' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161548', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161549
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161549' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161549', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161550
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161550' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161550', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161552
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161552' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161552', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161553
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161553' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161553', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161555
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161555' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161555', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161556
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161556' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161556', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161563
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161563' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161563', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161564
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161564' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161564', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161566
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161566' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161566', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161570
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161570' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161570', 'BLOEMFONTEIN MEDICAL DEPOT', '2025-12-23', 0);
    END

    -- Invoice: IN161565
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161565' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161565', 'FS HEALTH FEZILE DABI DISTRICT', '2025-12-23', 0);
    END

    -- Invoice: IN161567
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161567' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161567', 'FS HEALTH THEBE COMPLEX', '2025-12-23', 0);
    END

    -- Invoice: IN161554
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161554' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161554', 'FS HEALTH UNIVERSITAS HOSPITAL', '2025-12-23', 0);
    END

    -- Invoice: IN161558
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161558' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161558', 'CARLETONVILLE HOSPITAL', '2025-12-23', 0);
    END

    -- Invoice: IN161579
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161579' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161579', 'MOGALE SUB DISTRICT', '2025-12-23', 0);
    END

    -- Invoice: IN161568
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161568' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161568', 'EKURHULENI HEALTH DISTRICT', '2025-12-23', 0);
    END

    -- Invoice: IN161577
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161577' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161577', 'HEALTH TSHWANE REGION C', '2025-12-23', 0);
    END

    -- Invoice: IN161576
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161576' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161576', 'HEALTH TSHWANE REGION C', '2025-12-23', 0);
    END

    -- Invoice: IN161578
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161578' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161578', 'HEALTH TSHWANE REGION C', '2025-12-23', 0);
    END

    -- Invoice: IN161545
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161545' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161545', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-12-23', 0);
    END

    -- Invoice: IN161543
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161543' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161543', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-12-23', 0);
    END

    -- Invoice: IN161544
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161544' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161544', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-12-23', 0);
    END

    -- Invoice: IN161546
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161546' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161546', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-12-23', 0);
    END

    -- Invoice: IN161559
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161559' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161559', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-12-23', 0);
    END

    -- Invoice: IN161560
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161560' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161560', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-12-23', 0);
    END

    -- Invoice: IN161561
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161561' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161561', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-12-23', 0);
    END

    -- Invoice: IN161569
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161569' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161569', 'MEDICAL SUPPLY DEPOT TRANSITO -IN', '2025-12-23', 0);
    END

    -- Invoice: IN161747
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161747' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161747', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-05', 0);
    END

    -- Invoice: IN161748
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161748' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161748', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-05', 0);
    END

    -- Invoice: IN161743
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161743' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161743', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-05', 0);
    END

    -- Invoice: IN161744
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161744' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161744', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-05', 0);
    END

    -- Invoice: IN161745
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161745' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161745', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-05', 0);
    END

    -- Invoice: IN161746
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161746' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161746', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-05', 0);
    END

    -- Invoice: IN161750
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161750' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161750', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-05', 0);
    END

    -- Invoice: IN161749
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161749' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161749', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-05', 0);
    END

    -- Invoice: IN161751
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161751' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161751', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-05', 0);
    END

    -- Invoice: IN161753
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161753' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161753', 'BLOEMFONTEIN MEDICAL DEPOT', '2026-01-05', 0);
    END

    -- Invoice: IN161754
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161754' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161754', 'FS HEALTH MOFUMAHADI MANAPO HOSPITAL', '2026-01-05', 0);
    END

    -- Invoice: IN161755
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161755' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161755', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2026-01-05', 0);
    END

    -- Invoice: IN161756
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161756' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161756', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2026-01-05', 0);
    END

    -- Invoice: IN161757
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161757' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161757', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2026-01-05', 0);
    END

    -- Invoice: IN161758
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161758' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161758', 'FS HEALTH THABO MOFUTSANYANA DISTRICT', '2026-01-05', 0);
    END

    -- Invoice: IN161761
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161761' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161761', 'BHEKI MLANGENI DISTRICT HOSPITAL', '2026-01-05', 0);
    END

    -- Invoice: IN161773
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161773' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161773', 'HEIDELBURG HOSPITAL', '2026-01-05', 0);
    END

    -- Invoice: IN161760
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161760' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161760', 'SOUTH RAND HOSPITAL', '2026-01-05', 0);
    END

    -- Invoice: IN161762
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161762' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161762', 'DR. YUSUF DADOO HOSPITAL', '2026-01-05', 0);
    END

    -- Invoice: IN161759
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161759' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161759', 'TAMBO MEMORIAL HOSPITAL', '2026-01-05', 0);
    END

    -- Invoice: IN161752
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161752' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161752', 'SEBOKENG HOSPITAL', '2026-01-05', 0);
    END

    -- Invoice: IN161763
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161763' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161763', 'MOGALE SUB DISTRICT', '2026-01-05', 0);
    END

    -- Invoice: IN161911
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161911' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161911', 'KING DINUZULU HOSPITAL COMPLEX', '2026-01-06', 0);
    END

    -- Invoice: IN161908
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161908' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161908', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-06', 0);
    END

    -- Invoice: IN161909
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161909' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161909', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-06', 0);
    END

    -- Invoice: IN161904
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161904' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161904', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-06', 0);
    END

    -- Invoice: IN161905
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161905' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161905', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-06', 0);
    END

    -- Invoice: IN161906
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161906' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161906', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-06', 0);
    END

    -- Invoice: IN161907
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161907' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161907', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-06', 0);
    END

    -- Invoice: IN161910
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161910' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161910', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-06', 0);
    END

    -- Invoice: IN161903
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161903' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161903', 'FS HEALTH MOFUMAHADI MANAPO HOSPITAL', '2026-01-06', 0);
    END

    -- Invoice: IN161912
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN161912' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN161912', 'FS HEALTH THEBE COMPLEX', '2026-01-06', 0);
    END

    -- Invoice: IN162013
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162013' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162013', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162014
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162014' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162014', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162016
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162016' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162016', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162012
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162012' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162012', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162015
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162015' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162015', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162007
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162007' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162007', 'BLOEMFONTEIN MEDICAL DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162008
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162008' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162008', 'BLOEMFONTEIN MEDICAL DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162009
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162009' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162009', 'BLOEMFONTEIN MEDICAL DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162002
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162002' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162002', 'BLOEMFONTEIN MEDICAL DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162003
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162003' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162003', 'BLOEMFONTEIN MEDICAL DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162004
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162004' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162004', 'BLOEMFONTEIN MEDICAL DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162005
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162005' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162005', 'BLOEMFONTEIN MEDICAL DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162006
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162006' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162006', 'BLOEMFONTEIN MEDICAL DEPOT', '2026-01-07', 0);
    END

    -- Invoice: IN162010
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162010' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162010', 'TEMBISA HOSPITAL', '2026-01-07', 0);
    END

    -- Invoice: IN162011
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162011' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162011', 'WESTONARIA SUB DISTRICT', '2026-01-07', 0);
    END

    -- Invoice: IN162082
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162082' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162082', 'KEVIN MYNHARDT', '2026-01-08', 0);
    END

    -- Invoice: IN162088
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162088' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162088', 'LADYSMITH REGIONAL HOSPITAL', '2026-01-08', 0);
    END

    -- Invoice: IN162047
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162047' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162047', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-08', 0);
    END

    -- Invoice: IN162086
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162086' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162086', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-08', 0);
    END

    -- Invoice: IN162084
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162084' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162084', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-08', 0);
    END

    -- Invoice: IN162085
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162085' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162085', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-08', 0);
    END

    -- Invoice: IN162083
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162083' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162083', 'BLOEMFONTEIN MEDICAL DEPOT', '2026-01-08', 0);
    END

    -- Invoice: IN162087
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162087' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162087', 'BLOEMFONTEIN MEDICAL DEPOT', '2026-01-08', 0);
    END

    -- Invoice: IN162081
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162081' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162081', 'ZILAPHE INC', '2026-01-08', 0);
    END

    -- Invoice: IN162080
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162080' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162080', 'WITKOPPEN HEALTH & WELFARE CENTRE', '2026-01-08', 0);
    END

    -- Invoice: IN162227
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162227' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162227', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-12', 0);
    END

    -- Invoice: IN162230
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162230' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162230', 'FS HEALTH DR JS MOROKA DISTRICT', '2026-01-12', 0);
    END

    -- Invoice: IN162228
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162228' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162228', 'EKURHULENI HEALTH DISTRICT', '2026-01-12', 0);
    END

    -- Invoice: IN162231
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162231' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162231', 'MP HEALTH BETHAL HOSPITAL', '2026-01-12', 0);
    END

    -- Invoice: IN162394
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162394' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162394', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-15', 0);
    END

    -- Invoice: IN162398
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162398' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162398', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-15', 0);
    END

    -- Invoice: IN162399
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162399' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162399', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-15', 0);
    END

    -- Invoice: IN162395
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162395' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162395', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-15', 0);
    END

    -- Invoice: IN162397
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162397' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162397', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-15', 0);
    END

    -- Invoice: IN162392
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162392' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162392', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-15', 0);
    END

    -- Invoice: IN162393
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162393' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162393', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-15', 0);
    END

    -- Invoice: IN162396
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162396' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162396', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-15', 0);
    END

    -- Invoice: IN162400
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162400' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162400', 'PROVINCIAL PHARM SUPPLY DEPOT', '2026-01-15', 0);
    END

    -- Invoice: IN162390
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162390' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162390', 'PHOLOSONG HOSPITAL', '2026-01-15', 0);
    END

    -- Invoice: IN162388
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162388' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162388', 'JUBILEE DISTRICT HOSPITAL', '2026-01-15', 0);
    END

    -- Invoice: IN162391
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162391' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162391', 'PRETORIA WEST HOSPITAL', '2026-01-15', 0);
    END

    -- Invoice: IN162389
    IF NOT EXISTS (SELECT 1 FROM Sale WHERE SaleNumber = 'IN162389' AND IsDeleted = 0)
    BEGIN
        INSERT INTO Sale (SaleNumber, CustomerName, SaleDate, IsDeleted)
        VALUES ('IN162389', 'EKURHULENI HEALTH DISTRICT', '2026-01-15', 0);
    END

    DECLARE @SalesAfter INT = (SELECT COUNT(*) FROM Sale WHERE IsDeleted = 0);
    PRINT 'Sales after: ' + CAST(@SalesAfter AS NVARCHAR(10));
    PRINT 'Sales added: ' + CAST((@SalesAfter - @SalesBefore) AS NVARCHAR(10));

    COMMIT TRANSACTION;
    PRINT '';
    PRINT '✅ Import Complete';

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    PRINT '❌ ERROR: ' + ERROR_MESSAGE();
    THROW;
END CATCH;