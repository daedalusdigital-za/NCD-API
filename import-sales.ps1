# Import Sales Script - Prevents duplicates
$ErrorActionPreference = "Stop"

# Item Code to Inventory ID mapping
$itemMapping = @{
    "NDOH35002" = 25  # HEMOGLOBIN METER - BIO AID HB METER (need to create)
    "NDOH35003" = 13  # HEMOGLOBIN TEST STRIPS (50 HB TEST STRIPS)
    "NDOH35004" = 12  # GLUCOSE METER- BIO HERMES (BATTERY)
    "NDOH35005" = 22  # MULTIPARAMETER - TAIDOC
    "NDOH35006" = 23  # DUAL GLUCOSE & HBA1C METER- BIOHERMES
    "NDOH35007" = 26  # CHOLESTEROL MACHINE/METER (need to create)
    "NDOH35014" = 14  # HEMOGLOBIN METER - QUALITY CONTROL SOLUTIONS
    "NDOH35015" = 10  # HEMOGLOBIN METER - SINGLE USE DISPOSABLE LANCET
    "NDOH35016" = 24  # GLUCOSE METER - BATTERY
    "NDOH35017" = 2   # GLUCOSE TEST STRIPS
    "NDOH35018" = 9   # GLUCOSE METER - QUALITY CONTROL SOLUTIONS
    "NDOH35019" = 16  # MULTIPARAMETER - 50 KETONE TEST STRIPS VIAL
    "NDOH35020" = 17  # MULTIPARAMETER - 50 URIC ACID VIAL
    "NDOH35021" = 4   # MULTIPARAMETER - 50 CHOLESTEROL VIAL
    "NDOH35034" = 1   # HBA1C TEST STRIPS
    "NDOH35040" = 7   # DUAL GLUCOSE & HBA1C - CHARGING CABLE
}

# Get existing sales to check for duplicates
Write-Host "Fetching existing sales..." -ForegroundColor Yellow
$existingSales = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/Sales/GetAll" -Method Get
$existingSaleNumbers = $existingSales | Select-Object -ExpandProperty saleNumber
Write-Host "Found $($existingSales.Count) existing sales" -ForegroundColor Green

# Sales data grouped by invoice number
$salesData = @(
    @{ InvNo="IN162476"; Date="2026-01-15"; Customer="MOHAMED RANGILA"; Items=@(@{Code="NDOH35017";Qty=1;Price=44.84}) }
    @{ InvNo="IN162666"; Date="2026-01-15"; Customer="ZAMA RADEBE"; Items=@(@{Code="NDOH35005";Qty=1;Price=527.91},@{Code="NDOH35021";Qty=1;Price=688.57}) }
    @{ InvNo="IN162941"; Date="2026-01-15"; Customer="OSINDISWENI HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=650;Price=136.53}) }
    @{ InvNo="IN162394"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=30;Price=136.53}) }
    @{ InvNo="IN162398"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=300;Price=136.53}) }
    @{ InvNo="IN162399"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=83;Price=136.53}) }
    @{ InvNo="IN162469"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=5;Price=136.53}) }
    @{ InvNo="IN162473"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=10;Price=136.53}) }
    @{ InvNo="IN162474"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=22;Price=136.53}) }
    @{ InvNo="IN162535"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=1000;Price=136.53}) }
    @{ InvNo="IN162565"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=50;Price=136.53}) }
    @{ InvNo="IN162624"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=90;Price=136.53}) }
    @{ InvNo="IN162659"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=100;Price=136.53}) }
    @{ InvNo="IN162727"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=270;Price=136.53}) }
    @{ InvNo="IN162730"; Date="2026-01-15"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=167;Price=136.53}) }
    @{ InvNo="IN162733"; Date="2026-01-19"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=216;Price=136.53}) }
    @{ InvNo="IN162802"; Date="2026-01-19"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=550;Price=136.53}) }
    @{ InvNo="IN162803"; Date="2026-01-19"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=30;Price=136.53}) }
    @{ InvNo="IN162805"; Date="2026-01-19"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=100;Price=136.53}) }
    @{ InvNo="IN162806"; Date="2026-01-19"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=200;Price=136.53}) }
    @{ InvNo="IN162810"; Date="2026-01-19"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=300;Price=136.53}) }
    @{ InvNo="IN162940"; Date="2026-01-19"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=50;Price=136.53}) }
    @{ InvNo="IN162945"; Date="2026-01-19"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=30;Price=136.53}) }
    @{ InvNo="IN163126"; Date="2026-01-19"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=38;Price=136.53}) }
    @{ InvNo="IN163127"; Date="2026-01-19"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=300;Price=136.53}) }
    @{ InvNo="IN163204"; Date="2026-01-19"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=180;Price=136.53}) }
    @{ InvNo="IN163205"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=108;Price=136.53}) }
    @{ InvNo="IN163207"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=20;Price=136.53}) }
    @{ InvNo="IN163252"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=82;Price=136.53}) }
    @{ InvNo="IN163284"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35004";Qty=200;Price=136.53}) }
    @{ InvNo="IN162395"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35006";Qty=1;Price=2198.24}) }
    @{ InvNo="IN162397"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35006";Qty=3;Price=1763.70}) }
    @{ InvNo="IN162392"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=50;Price=44.84}) }
    @{ InvNo="IN162393"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=800;Price=44.84}) }
    @{ InvNo="IN162396"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=1000;Price=44.84}) }
    @{ InvNo="IN162468"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=250;Price=44.84}) }
    @{ InvNo="IN162470"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=100;Price=44.84}) }
    @{ InvNo="IN162564"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=1000;Price=44.84}) }
    @{ InvNo="IN162657"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=300;Price=44.84}) }
    @{ InvNo="IN162660"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=1000;Price=44.84}) }
    @{ InvNo="IN162728"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=1000;Price=44.84}) }
    @{ InvNo="IN162729"; Date="2026-01-20"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=500;Price=44.84}) }
    @{ InvNo="IN162732"; Date="2026-01-21"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=3000;Price=44.84}) }
    @{ InvNo="IN162734"; Date="2026-01-21"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=1000;Price=44.84}) }
    @{ InvNo="IN162735"; Date="2026-01-21"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=3000;Price=44.84}) }
    @{ InvNo="IN162736"; Date="2026-01-21"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=20000;Price=44.84}) }
    @{ InvNo="IN162807"; Date="2026-01-22"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=370;Price=44.84}) }
    @{ InvNo="IN162808"; Date="2026-01-22"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=600;Price=44.84}) }
    @{ InvNo="IN162811"; Date="2026-01-22"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=1100;Price=44.84}) }
    @{ InvNo="IN162937"; Date="2026-01-22"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=200;Price=44.84}) }
    @{ InvNo="IN162938"; Date="2026-01-22"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=180;Price=44.84}) }
    @{ InvNo="IN162939"; Date="2026-01-23"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=200;Price=44.84}) }
    @{ InvNo="IN162944"; Date="2026-01-23"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=200;Price=44.84}) }
    @{ InvNo="IN163123"; Date="2026-01-23"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=1500;Price=44.84}) }
    @{ InvNo="IN163206"; Date="2026-01-23"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=950;Price=44.84}) }
    @{ InvNo="IN163253"; Date="2026-01-23"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=450;Price=44.84}) }
    @{ InvNo="IN163285"; Date="2026-01-26"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35017";Qty=600;Price=44.84}) }
    @{ InvNo="IN162400"; Date="2026-01-26"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35034";Qty=14;Price=1763.70}) }
    @{ InvNo="IN162809"; Date="2026-01-26"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35034";Qty=4;Price=1763.71}) }
    @{ InvNo="IN162936"; Date="2026-01-26"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35034";Qty=2;Price=2198.25}) }
    @{ InvNo="IN163203"; Date="2026-01-26"; Customer="PROVINCIAL PHARM SUPPLY DEPOT"; Items=@(@{Code="NDOH35034";Qty=7;Price=1763.70}) }
    @{ InvNo="IN162738"; Date="2026-01-28"; Customer="DEPARTMENT OF HEALTH LIMPOPO"; Items=@(@{Code="NDOH35002";Qty=10900;Price=395.69}) }
    @{ InvNo="IN162737"; Date="2026-01-28"; Customer="DEPARTMENT OF HEALTH LIMPOPO"; Items=@(@{Code="NDOH35003";Qty=4600;Price=139.35}) }
    @{ InvNo="IN162943"; Date="2026-01-28"; Customer="DEPARTMENT OF HEALTH NORTH WEST"; Items=@(@{Code="NDOH35004";Qty=5000;Price=136.53}) }
    @{ InvNo="IN162942"; Date="2026-01-28"; Customer="DEPARTMENT OF HEALTH NORTH WEST"; Items=@(@{Code="NDOH35017";Qty=18000;Price=44.84}) }
    @{ InvNo="IN162533"; Date="2026-01-28"; Customer="TSWAING SUB DISTRICT"; Items=@(@{Code="NDOH35005";Qty=13;Price=527.91},@{Code="NDOH35021";Qty=26;Price=688.57}) }
    @{ InvNo="IN163202"; Date="2026-01-28"; Customer="BLOEMFONTEIN MEDICAL DEPOT"; Items=@(@{Code="NDOH35004";Qty=10;Price=136.53}) }
    @{ InvNo="IN163250"; Date="2026-01-28"; Customer="BLOEMFONTEIN MEDICAL DEPOT"; Items=@(@{Code="NDOH35004";Qty=100;Price=136.53}) }
    @{ InvNo="IN162519"; Date="2026-01-28"; Customer="BLOEMFONTEIN MEDICAL DEPOT"; Items=@(@{Code="NDOH35017";Qty=150;Price=44.84}) }
    @{ InvNo="IN162563"; Date="2026-01-28"; Customer="BLOEMFONTEIN MEDICAL DEPOT"; Items=@(@{Code="NDOH35017";Qty=1000;Price=44.84}) }
    @{ InvNo="IN162801"; Date="2026-01-29"; Customer="BLOEMFONTEIN MEDICAL DEPOT"; Items=@(@{Code="NDOH35017";Qty=1200;Price=44.84}) }
    @{ InvNo="IN163254"; Date="2026-01-29"; Customer="BLOEMFONTEIN MEDICAL DEPOT"; Items=@(@{Code="NDOH35017";Qty=200;Price=44.84}) }
    @{ InvNo="IN163255"; Date="2026-01-29"; Customer="BLOEMFONTEIN MEDICAL DEPOT"; Items=@(@{Code="NDOH35017";Qty=100;Price=44.84}) }
    @{ InvNo="IN162739"; Date="2026-01-29"; Customer="FS HEALTH EMBEKWENI COMPLEX"; Items=@(@{Code="NDOH35003";Qty=170;Price=139.35}) }
    @{ InvNo="IN162843"; Date="2026-01-29"; Customer="FS HEALTH FEZI NGOBENTOMBI HOSPITAL"; Items=@(@{Code="NDOH35016";Qty=240;Price=7.23}) }
    @{ InvNo="IN163208"; Date="2026-01-29"; Customer="FS HEALTH FEZILE DABI DISTRICT"; Items=@(@{Code="NDOH35004";Qty=250;Price=136.53},@{Code="NDOH35017";Qty=1100;Price=44.84}) }
    @{ InvNo="IN162475"; Date="2026-01-29"; Customer="FS HEALTH MOFUMAHADI MANAPO HOSPITAL"; Items=@(@{Code="NDOH35018";Qty=19;Price=24.10}) }
    @{ InvNo="IN163283"; Date="2026-01-29"; Customer="FS HEALTH THABO MOFUTSANYANA DISTRICT"; Items=@(@{Code="NDOH35040";Qty=22;Price=31.33}) }
    @{ InvNo="IN163256"; Date="2026-01-29"; Customer="EC HEALTH BCM DISTR HUB"; Items=@(@{Code="NDOH35005";Qty=14;Price=527.91},@{Code="NDOH35006";Qty=67;Price=2198.24},@{Code="NDOH35021";Qty=73;Price=688.57},@{Code="NDOH35034";Qty=12;Price=1763.70},@{Code="NDOH35040";Qty=68;Price=31.33}) }
    @{ InvNo="IN163037"; Date="2026-01-30"; Customer="DOCTORS WITHOUT BORDERS"; Items=@(@{Code="NDOH35006";Qty=180;Price=1787.72},@{Code="NDOH35017";Qty=800;Price=44.84},@{Code="NDOH35018";Qty=180;Price=12.05},@{Code="NDOH35034";Qty=630;Price=1564.60}) }
    @{ InvNo="IN162518"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=40;Price=395.69},@{Code="NDOH35003";Qty=40;Price=139.35},@{Code="NDOH35004";Qty=2300;Price=136.53},@{Code="NDOH35005";Qty=40;Price=527.91},@{Code="NDOH35006";Qty=40;Price=2198.24},@{Code="NDOH35007";Qty=40;Price=517.36},@{Code="NDOH35015";Qty=4000;Price=0.49},@{Code="NDOH35017";Qty=2300;Price=44.84},@{Code="NDOH35018";Qty=2300;Price=24.10},@{Code="NDOH35019";Qty=40;Price=400.68},@{Code="NDOH35020";Qty=40;Price=275.43},@{Code="NDOH35021";Qty=40;Price=688.57},@{Code="NDOH35034";Qty=40;Price=1763.70},@{Code="NDOH35040";Qty=10;Price=31.33}) }
    @{ InvNo="IN162839"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=4;Price=395.69},@{Code="NDOH35003";Qty=4;Price=139.35},@{Code="NDOH35006";Qty=4;Price=2198.24},@{Code="NDOH35007";Qty=4;Price=517.36},@{Code="NDOH35017";Qty=5;Price=44.84},@{Code="NDOH35021";Qty=4;Price=688.57},@{Code="NDOH35034";Qty=4;Price=1763.71}) }
    @{ InvNo="IN162840"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=6;Price=395.69},@{Code="NDOH35003";Qty=6;Price=139.35}) }
    @{ InvNo="IN162841"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=2;Price=395.69},@{Code="NDOH35003";Qty=2;Price=139.35},@{Code="NDOH35006";Qty=2;Price=2198.25},@{Code="NDOH35007";Qty=2;Price=517.36},@{Code="NDOH35017";Qty=15;Price=44.84},@{Code="NDOH35021";Qty=2;Price=688.57},@{Code="NDOH35034";Qty=2;Price=1763.71}) }
    @{ InvNo="IN162842"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=4;Price=395.69},@{Code="NDOH35003";Qty=4;Price=139.35},@{Code="NDOH35006";Qty=4;Price=2198.24},@{Code="NDOH35007";Qty=4;Price=517.36},@{Code="NDOH35017";Qty=4;Price=44.84},@{Code="NDOH35021";Qty=4;Price=688.57},@{Code="NDOH35034";Qty=4;Price=1763.71}) }
    @{ InvNo="IN162844"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=4;Price=395.69},@{Code="NDOH35003";Qty=4;Price=139.35},@{Code="NDOH35006";Qty=4;Price=2198.24},@{Code="NDOH35007";Qty=4;Price=517.36},@{Code="NDOH35017";Qty=21;Price=44.84},@{Code="NDOH35021";Qty=4;Price=688.57},@{Code="NDOH35034";Qty=4;Price=1763.71}) }
    @{ InvNo="IN162845"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=4;Price=395.69},@{Code="NDOH35003";Qty=4;Price=139.35},@{Code="NDOH35006";Qty=4;Price=2198.24},@{Code="NDOH35007";Qty=4;Price=517.36},@{Code="NDOH35017";Qty=15;Price=44.84},@{Code="NDOH35021";Qty=4;Price=688.57},@{Code="NDOH35034";Qty=4;Price=1763.71}) }
    @{ InvNo="IN162846"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=4;Price=395.69},@{Code="NDOH35003";Qty=4;Price=139.35},@{Code="NDOH35006";Qty=4;Price=2198.24},@{Code="NDOH35007";Qty=4;Price=517.36},@{Code="NDOH35017";Qty=11;Price=44.84},@{Code="NDOH35021";Qty=4;Price=688.57},@{Code="NDOH35034";Qty=4;Price=1763.71}) }
    @{ InvNo="IN162847"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=4;Price=395.69},@{Code="NDOH35003";Qty=4;Price=139.35},@{Code="NDOH35006";Qty=4;Price=2198.24},@{Code="NDOH35007";Qty=4;Price=517.36},@{Code="NDOH35017";Qty=11;Price=44.84},@{Code="NDOH35021";Qty=4;Price=688.57},@{Code="NDOH35034";Qty=4;Price=1763.71}) }
    @{ InvNo="IN162850"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=4;Price=395.69},@{Code="NDOH35003";Qty=4;Price=139.35},@{Code="NDOH35006";Qty=4;Price=2198.24},@{Code="NDOH35007";Qty=4;Price=517.36},@{Code="NDOH35017";Qty=10;Price=44.84},@{Code="NDOH35021";Qty=4;Price=688.57},@{Code="NDOH35034";Qty=4;Price=1763.71}) }
    @{ InvNo="IN162851"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=5;Price=395.69},@{Code="NDOH35003";Qty=5;Price=139.35},@{Code="NDOH35004";Qty=25;Price=136.53},@{Code="NDOH35006";Qty=5;Price=2198.24},@{Code="NDOH35007";Qty=5;Price=517.36},@{Code="NDOH35021";Qty=5;Price=688.57},@{Code="NDOH35034";Qty=5;Price=1763.70}) }
    @{ InvNo="IN162946"; Date="2026-01-30"; Customer="HILLBROW CHC"; Items=@(@{Code="NDOH35002";Qty=4;Price=395.69},@{Code="NDOH35003";Qty=4;Price=139.35},@{Code="NDOH35006";Qty=4;Price=2198.24},@{Code="NDOH35007";Qty=4;Price=517.36},@{Code="NDOH35017";Qty=5;Price=44.84},@{Code="NDOH35021";Qty=4;Price=688.57},@{Code="NDOH35034";Qty=4;Price=1763.71}) }
    @{ InvNo="IN163125"; Date="2026-02-04"; Customer="FAR EAST RAND HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=540;Price=136.53}) }
    @{ InvNo="IN163121"; Date="2026-02-06"; Customer="FAR EAST RAND HOSPITAL"; Items=@(@{Code="NDOH35017";Qty=120;Price=44.84}) }
    @{ InvNo="IN162534"; Date="2026-02-06"; Customer="BHEKI MLANGENI DISTRICT HOSPITAL"; Items=@(@{Code="NDOH35003";Qty=100;Price=139.35}) }
    @{ InvNo="IN162467"; Date="2026-02-06"; Customer="KALAFONG HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=1890;Price=136.53}) }
    @{ InvNo="IN162472"; Date="2026-02-06"; Customer="HEIDELBURG HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=216;Price=136.53},@{Code="NDOH35017";Qty=1800;Price=44.84}) }
    @{ InvNo="IN162658"; Date="2026-02-06"; Customer="RAHIMA MOOSA MOTHER & CHILD HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=500;Price=136.53}) }
    @{ InvNo="IN162390"; Date="2026-02-06"; Customer="PHOLOSONG HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=162;Price=136.53},@{Code="NDOH35017";Qty=1200;Price=44.84}) }
    @{ InvNo="IN162625"; Date="2026-02-06"; Customer="HELEN JOSEPH HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=500;Price=136.53}) }
    @{ InvNo="IN162623"; Date="2026-02-06"; Customer="HELEN JOSEPH HOSPITAL"; Items=@(@{Code="NDOH35017";Qty=4000;Price=44.84}) }
    @{ InvNo="IN162934"; Date="2026-02-06"; Customer="TAMBO MEMORIAL HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=1500;Price=136.53},@{Code="NDOH35017";Qty=3000;Price=44.84},@{Code="NDOH35018";Qty=1500;Price=24.10}) }
    @{ InvNo="IN163120"; Date="2026-02-10"; Customer="MAMELODI HOSPITAL"; Items=@(@{Code="NDOH35017";Qty=3300;Price=44.84}) }
    @{ InvNo="IN163289"; Date="2026-02-10"; Customer="LERATONG HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=150;Price=136.53},@{Code="NDOH35017";Qty=6000;Price=44.84}) }
    @{ InvNo="IN163282"; Date="2026-02-10"; Customer="JUBILEE DISTRICT HOSPITAL"; Items=@(@{Code="NDOH35002";Qty=100;Price=395.69},@{Code="NDOH35003";Qty=1000;Price=139.35}) }
    @{ InvNo="IN162388"; Date="2026-02-10"; Customer="JUBILEE DISTRICT HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=400;Price=136.53},@{Code="NDOH35017";Qty=4000;Price=44.84}) }
    @{ InvNo="IN162391"; Date="2026-02-12"; Customer="PRETORIA WEST HOSPITAL"; Items=@(@{Code="NDOH35017";Qty=1500;Price=44.84}) }
    @{ InvNo="IN162804"; Date="2026-02-12"; Customer="EDENVALE GENERAL HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=500;Price=136.53},@{Code="NDOH35017";Qty=1000;Price=44.84}) }
    @{ InvNo="IN163287"; Date="2026-02-12"; Customer="STEVE BIKO ACADEMIC HOSPITAL"; Items=@(@{Code="NDOH35004";Qty=1000;Price=136.53}) }
    @{ InvNo="IN162935"; Date="2026-02-12"; Customer="STEVE BIKO ACADEMIC HOSPITAL"; Items=@(@{Code="NDOH35017";Qty=5000;Price=44.84}) }
    @{ InvNo="IN163288"; Date="2026-02-12"; Customer="STEVE BIKO ACADEMIC HOSPITAL"; Items=@(@{Code="NDOH35017";Qty=5000;Price=44.84}) }
    @{ InvNo="IN162389"; Date="2026-02-12"; Customer="EKURHULENI HEALTH DISTRICT"; Items=@(@{Code="NDOH35004";Qty=1000;Price=136.53},@{Code="NDOH35017";Qty=6000;Price=44.84}) }
    @{ InvNo="IN163122"; Date="2026-02-12"; Customer="EKURHULENI HEALTH DISTRICT"; Items=@(@{Code="NDOH35004";Qty=1000;Price=136.53},@{Code="NDOH35017";Qty=6000;Price=44.84}) }
    @{ InvNo="IN163124"; Date="2026-02-12"; Customer="EKURHULENI HEALTH DISTRICT"; Items=@(@{Code="NDOH35017";Qty=6000;Price=44.84}) }
    @{ InvNo="IN162848"; Date="2026-02-12"; Customer="EKURHULENI HEALTH DISTRICT"; Items=@(@{Code="NDOH35034";Qty=210;Price=1763.70}) }
    @{ InvNo="IN162471"; Date="2026-02-13"; Customer="STERKFONTEIN HOSPITAL"; Items=@(@{Code="NDOH35017";Qty=500;Price=44.84}) }
    @{ InvNo="IN162626"; Date="2026-02-13"; Customer="HEALTH REGION B"; Items=@(@{Code="NDOH35004";Qty=300;Price=136.53}) }
    @{ InvNo="IN162627"; Date="2026-02-13"; Customer="HEALTH REGION B"; Items=@(@{Code="NDOH35017";Qty=3000;Price=44.84}) }
    @{ InvNo="IN162554"; Date="2026-02-13"; Customer="WEST RAND HEALTH DISTRICT OFFICE"; Items=@(@{Code="NDOH35002";Qty=8;Price=395.69},@{Code="NDOH35003";Qty=30;Price=139.35}) }
    @{ InvNo="IN163249"; Date="2026-02-13"; Customer="MEDICAL SUPPLY DEPOT TRANSITO -IN"; Items=@(@{Code="NDOH35017";Qty=1000;Price=44.84}) }
    @{ InvNo="IN163251"; Date="2026-02-13"; Customer="MEDICAL SUPPLY DEPOT TRANSITO -IN"; Items=@(@{Code="NDOH35017";Qty=2000;Price=44.84}) }
    @{ InvNo="IN163286"; Date="2026-02-13"; Customer="MEDICAL SUPPLY DEPOT TRANSITO -IN"; Items=@(@{Code="NDOH35017";Qty=2000;Price=44.84}) }
    @{ InvNo="IN162849"; Date="2026-02-13"; Customer="WITKOPPEN HEALTH & WELFARE CENTRE"; Items=@(@{Code="NDOH35034";Qty=3;Price=1763.70}) }
)

# First, we need to create missing inventory items
$missingItems = @(
    @{ sku="NDOH35002"; name="HEMOGLOBIN METER - BIO AID HB METER"; price=395.69 }
    @{ sku="NDOH35007"; name="CHOLESTEROL MACHINE/METER"; price=517.36 }
)

# Check if items exist, create if not
$existingItems = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/Inventory/GetAll" -Method Get
$existingSkus = $existingItems | Select-Object -ExpandProperty sku

foreach ($item in $missingItems) {
    if ($existingSkus -notcontains $item.sku) {
        Write-Host "Creating missing inventory item: $($item.name)..." -ForegroundColor Yellow
        $newItem = @{
            name = $item.name
            description = $item.name
            category = 1
            sku = $item.sku
            unitOfMeasure = "EACH"
            unitPrice = $item.price
            stockAvailable = 0
            reorderLevel = 0
            status = 1
        }
        try {
            $response = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/Inventory/Add" -Method Post -Body ($newItem | ConvertTo-Json) -ContentType "application/json"
            Write-Host "Created: $($item.name)" -ForegroundColor Green
        } catch {
            Write-Host "Failed to create $($item.name): $_" -ForegroundColor Red
        }
    }
}

# Refresh inventory list and update mapping
Start-Sleep -Seconds 2
$existingItems = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/Inventory/GetAll" -Method Get
foreach ($inv in $existingItems) {
    $itemMapping[$inv.sku] = $inv.id
}

Write-Host "`nItem Mapping:" -ForegroundColor Cyan
$itemMapping.GetEnumerator() | Sort-Object Name | ForEach-Object { Write-Host "  $($_.Key) -> ID $($_.Value)" }

# Process sales
$addedCount = 0
$skippedCount = 0
$errorCount = 0

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Processing Sales..." -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

foreach ($sale in $salesData) {
    # Skip if already exists
    if ($existingSaleNumbers -contains $sale.InvNo) {
        Write-Host "SKIP: $($sale.InvNo) - Already exists" -ForegroundColor Yellow
        $skippedCount++
        continue
    }
    
    # Build sale items
    $saleItems = @()
    foreach ($item in $sale.Items) {
        $inventoryId = $itemMapping[$item.Code]
        if (-not $inventoryId) {
            Write-Host "WARNING: No inventory ID for $($item.Code)" -ForegroundColor Red
            continue
        }
        $saleItems += @{
            inventoryItemId = $inventoryId
            quantity = $item.Qty
            unitPrice = $item.Price
        }
    }
    
    if ($saleItems.Count -eq 0) {
        Write-Host "SKIP: $($sale.InvNo) - No valid items" -ForegroundColor Red
        $errorCount++
        continue
    }
    
    # Calculate total
    $total = ($saleItems | ForEach-Object { $_.quantity * $_.unitPrice } | Measure-Object -Sum).Sum
    
    # Build sale request
    $saleRequest = @{
        saleNumber = $sale.InvNo
        saleDate = $sale.Date
        customerName = $sale.Customer
        customerPhone = ""
        subtotal = $total
        total = $total
        notes = "Imported from sales data"
        saleItems = $saleItems
    }
    
    # Post to API
    try {
        $jsonBody = $saleRequest | ConvertTo-Json -Depth 5
        $response = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/Sales/Add" -Method Post -Body $jsonBody -ContentType "application/json"
        Write-Host "ADDED: $($sale.InvNo) - $($sale.Customer) - R$([math]::Round($total,2))" -ForegroundColor Green
        $addedCount++
        Start-Sleep -Milliseconds 100  # Small delay to avoid overwhelming the API
    } catch {
        Write-Host "ERROR: $($sale.InvNo) - $($_.Exception.Message)" -ForegroundColor Red
        $errorCount++
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Import Complete!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Added: $addedCount sales" -ForegroundColor Green
Write-Host "Skipped (duplicates): $skippedCount sales" -ForegroundColor Yellow
Write-Host "Errors: $errorCount sales" -ForegroundColor Red

# Verify final count
$finalSales = Invoke-RestMethod -Uri "https://ngcanduapi.azurewebsites.net/api/Sales/GetAll" -Method Get
Write-Host "`nFinal sales count: $($finalSales.Count)" -ForegroundColor Cyan
