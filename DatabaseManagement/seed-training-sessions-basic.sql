-- ============================================
-- Training Sessions Seeder Script
-- Inserts 30 Training Session records
-- ============================================

SET NOCOUNT ON;

PRINT 'Starting Training Sessions Seeder...';
PRINT '====================================';

-- Province ID Reference:
-- 1 = Eastern Cape, 2 = Free State, 3 = Gauteng, 4 = KwaZulu-Natal, 5 = Limpopo
-- 6 = Mpumalanga, 7 = Northern Cape, 8 = North West, 9 = Western Cape

-- First, get a valid user ID from AspNetUsers
-- Run this query first: SELECT TOP 1 Id FROM AspNetUsers;
-- Then replace @ValidUserId with that value

DECLARE @ValidUserId INT;
SELECT TOP 1 @ValidUserId = Id FROM AspNetUsers;

IF @ValidUserId IS NULL
BEGIN
    PRINT 'ERROR: No users found in AspNetUsers table. Please create a user first.';
    RETURN;
END

PRINT 'Using User ID: ' + CAST(@ValidUserId AS VARCHAR(10));

-- Insert 30 Training Sessions
INSERT INTO TrainingSession (
    TrainingName,
    TrainingType,
    TrainingDate,
    ProvinceId,
    Venue,
    TrainerId,
    TargetAudience,
    NumberOfParticipants,
    Status,
    IsDeleted,
    CreatedBy
)
VALUES
-- Trainer IDs: 1=Lindani, 2=Dylan, 3=Selby, 4=Ziba, 5=Masixole
-- Session 1 - Western Cape (9) - Lindani
('NCD Prevention and Management Basics', 'NDC Training Workshop', '2025-01-15 08:00:00', 9, 'Cape Town International Convention Centre', 1, 'Primary Healthcare Nurses', 45, 3, 0, @ValidUserId),
-- Session 2 - Gauteng (3) - Dylan
('Diabetes Management Workshop', 'NDC Training Workshop', '2025-01-22 09:00:00', 3, 'Johannesburg Convention Centre', 2, 'Community Health Workers', 60, 3, 0, @ValidUserId),
-- Session 3 - KwaZulu-Natal (4) - Selby
('Hypertension Control Programme', 'Virtual Training', '2025-02-05 10:00:00', 4, 'Online - Microsoft Teams', 3, 'Clinical Associates', 80, 3, 0, @ValidUserId),
-- Session 4 - Eastern Cape (1) - Ziba
('Cardiovascular Disease Prevention', 'NDC Training Workshop', '2025-02-12 08:30:00', 1, 'East London ICC', 4, 'General Practitioners', 35, 3, 0, @ValidUserId),
-- Session 5 - Free State (2) - Masixole
('Mental Health in NCD Patients', 'Virtual Training', '2025-02-20 09:00:00', 2, 'Online - Zoom', 5, 'Psychologists and Counsellors', 55, 3, 0, @ValidUserId),
-- Session 6 - Mpumalanga (6) - Lindani
('Chronic Respiratory Disease Management', 'NDC Training Workshop', '2025-03-03 08:00:00', 6, 'Mbombela Civic Centre', 1, 'Respiratory Therapists', 40, 3, 0, @ValidUserId),
-- Session 7 - Limpopo (5) - Dylan
('Cancer Screening and Early Detection', 'NDC Training Workshop', '2025-03-17 09:00:00', 5, 'Polokwane Conference Centre', 2, 'Oncology Nurses', 30, 3, 0, @ValidUserId),
-- Session 8 - North West (8) - Selby
('Nutrition and NCDs', 'Virtual Training', '2025-03-25 10:00:00', 8, 'Online - Microsoft Teams', 3, 'Dietitians and Nutritionists', 70, 3, 0, @ValidUserId),
-- Session 9 - Northern Cape (7) - Ziba
('Paediatric NCD Prevention', 'NDC Training Workshop', '2025-04-07 08:30:00', 7, 'Kimberley City Hall', 4, 'Paediatric Nurses', 25, 3, 0, @ValidUserId),
-- Session 10 - Western Cape (9) - Masixole
('NCD Data Management and Reporting', 'Virtual Training', '2025-04-15 09:00:00', 9, 'Online - Zoom', 5, 'Health Information Officers', 90, 3, 0, @ValidUserId),
-- Session 11 - Gauteng (3) - Lindani
('Integrated Chronic Disease Management', 'NDC Training Workshop', '2025-05-05 08:00:00', 3, 'Pretoria Showgrounds', 1, 'Primary Healthcare Teams', 50, 3, 0, @ValidUserId),
-- Session 12 - KwaZulu-Natal (4) - Dylan
('Stroke Prevention and Rehabilitation', 'NDC Training Workshop', '2025-05-19 09:00:00', 4, 'Durban ICC', 2, 'Physiotherapists and OTs', 38, 3, 0, @ValidUserId),
-- Session 13 - Eastern Cape (1) - Selby
('Kidney Disease and NCDs', 'Virtual Training', '2025-06-02 10:00:00', 1, 'Online - Microsoft Teams', 3, 'Nephrology Nurses', 65, 3, 0, @ValidUserId),
-- Session 14 - Free State (2) - Ziba
('Eye Health and Diabetes', 'NDC Training Workshop', '2025-06-16 08:30:00', 2, 'Bloemfontein Conference Centre', 4, 'Ophthalmology Staff', 28, 3, 0, @ValidUserId),
-- Session 15 - Mpumalanga (6) - Masixole
('Tobacco Cessation Counselling', 'Virtual Training', '2025-07-01 09:00:00', 6, 'Online - Zoom', 5, 'All Healthcare Workers', 120, 3, 0, @ValidUserId),
-- Session 16 - Limpopo (5) - Lindani
('Alcohol and Substance Abuse in NCDs', 'NDC Training Workshop', '2025-07-14 08:00:00', 5, 'Tzaneen Civic Centre', 1, 'Social Workers and Counsellors', 42, 3, 0, @ValidUserId),
-- Session 17 - North West (8) - Dylan
('NCD Management in Pregnancy', 'NDC Training Workshop', '2025-08-04 09:00:00', 8, 'Rustenburg Civic Centre', 2, 'Midwives and OB Nurses', 35, 3, 0, @ValidUserId),
-- Session 18 - Northern Cape (7) - Selby
('Palliative Care for NCD Patients', 'Virtual Training', '2025-08-18 10:00:00', 7, 'Online - Microsoft Teams', 3, 'Palliative Care Teams', 55, 3, 0, @ValidUserId),
-- Session 19 - Western Cape (9) - Ziba
('Physical Activity Prescription', 'NDC Training Workshop', '2025-09-01 08:30:00', 9, 'Stellenbosch University Conference Centre', 4, 'Biokineticists and Exercise Specialists', 32, 3, 0, @ValidUserId),
-- Session 20 - Gauteng (3) - Masixole
('Community-Based NCD Prevention', 'NDC Training Workshop', '2025-09-15 09:00:00', 3, 'Soweto Theatre', 5, 'Community Health Workers', 75, 3, 0, @ValidUserId),
-- Session 21 - KwaZulu-Natal (4) - Lindani - Scheduled
('Advanced Diabetes Insulin Management', 'NDC Training Workshop', '2025-12-01 08:00:00', 4, 'Pietermaritzburg City Hall', 1, 'Diabetes Educators', 40, 1, 0, @ValidUserId),
-- Session 22 - Eastern Cape (1) - Dylan - Scheduled
('NCD Quality Improvement Workshop', 'Virtual Training', '2025-12-08 09:00:00', 1, 'Online - Zoom', 2, 'Facility Managers', 60, 1, 0, @ValidUserId),
-- Session 23 - Free State (2) - Selby - Scheduled
('Hypertension Medication Update 2025', 'Virtual Training', '2025-12-10 10:00:00', 2, 'Online - Microsoft Teams', 3, 'Pharmacists and Prescribers', 100, 1, 0, @ValidUserId),
-- Session 24 - Mpumalanga (6) - Ziba - In Progress
('Integrated NCD-HIV Care', 'NDC Training Workshop', '2025-11-24 08:00:00', 6, 'Nelspruit Conference Centre', 4, 'HIV Clinicians and NCD Specialists', 45, 2, 0, @ValidUserId),
-- Session 25 - Limpopo (5) - Masixole - Scheduled
('Obesity Management Strategies', 'NDC Training Workshop', '2025-12-15 09:00:00', 5, 'Thohoyandou Community Hall', 5, 'Dietitians and GPs', 38, 1, 0, @ValidUserId),
-- Session 26 - Gauteng (3) - Lindani - Cancelled
('NCD Leadership Summit', 'NDC Training Workshop', '2025-10-20 08:00:00', 3, 'Sandton Convention Centre', 1, 'District Health Managers', 50, 4, 0, @ValidUserId),
-- Session 27 - North West (8) - Dylan - Scheduled
('Telemedicine for NCD Care', 'Virtual Training', '2026-01-12 10:00:00', 8, 'Online - Microsoft Teams', 2, 'Telehealth Coordinators', 85, 1, 0, @ValidUserId),
-- Session 28 - Northern Cape (7) - Selby - Scheduled
('NCD Emergency Protocols', 'NDC Training Workshop', '2026-01-20 08:30:00', 7, 'Upington Training Centre', 3, 'Emergency Department Staff', 30, 1, 0, @ValidUserId),
-- Session 29 - Western Cape (9) - Ziba - Scheduled
('Adolescent NCD Prevention', 'Virtual Training', '2026-02-03 09:00:00', 9, 'Online - Zoom', 4, 'School Health Nurses', 95, 1, 0, @ValidUserId),
-- Session 30 - KwaZulu-Natal (4) - Masixole - Scheduled
('NCD Refresher Training 2026', 'NDC Training Workshop', '2026-02-17 08:00:00', 4, 'Richards Bay Civic Centre', 5, 'All PHC Staff', 65, 1, 0, @ValidUserId);

PRINT '';
PRINT '====================================';
PRINT '30 Training Sessions inserted!';
PRINT '====================================';

-- Verify
SELECT COUNT(*) AS TotalTrainingSessions FROM TrainingSession WHERE IsDeleted = 0;
