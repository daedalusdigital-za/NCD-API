-- ============================================
-- Training Sessions Seeder Script
-- Generates 30 realistic training session records
-- Run this script after the TrainingSession table exists
-- ============================================

-- First, check if we have trainers. If not, we'll use NULL for TrainerId
-- You may need to adjust TrainerId values based on your actual Trainer table

SET NOCOUNT ON;

PRINT 'Starting Training Sessions Seeder...';
PRINT '====================================';

-- Clear existing data (optional - comment out if you want to keep existing records)
-- DELETE FROM TrainingSession;
-- DBCC CHECKIDENT ('TrainingSession', RESEED, 0);

-- Insert 30 Training Sessions with realistic South African data
INSERT INTO TrainingSession (
    TrainingName,
    TrainingType,
    TrainingDate,
    EndDate,
    ProvinceId,
    Venue,
    TrainerId,
    TargetAudience,
    NumberOfParticipants,
    Status,
    Hospital,
    TrainingObjectives,
    TrainingMaterials,
    IsDeleted,
    DateCreated,
    CreatedBy
)
VALUES
-- Session 1
(
    'NCD Prevention and Management Basics',
    'NDC Training Workshop',
    '2025-01-15 08:00:00',
    '2025-01-17 16:00:00',
    'Western Cape',
    'Cape Town International Convention Centre',
    1,
    'Primary Healthcare Nurses',
    45,
    3, -- Completed
    'Groote Schuur Hospital',
    'Understand NCD risk factors, screening protocols, and patient education techniques',
    'NCD Guidelines Manual, Screening Tools, Patient Education Pamphlets',
    0,
    GETDATE(),
    'system'
),
-- Session 2
(
    'Diabetes Management Workshop',
    'NDC Training Workshop',
    '2025-01-22 09:00:00',
    '2025-01-23 17:00:00',
    'Gauteng',
    'Johannesburg Convention Centre',
    2,
    'Community Health Workers',
    60,
    3, -- Completed
    'Charlotte Maxeke Hospital',
    'Comprehensive diabetes care including insulin management and foot care',
    'Diabetes Care Protocol, Glucometer Training Kit, Dietary Guidelines',
    0,
    GETDATE(),
    'system'
),
-- Session 3
(
    'Hypertension Control Programme',
    'Virtual Training',
    '2025-02-05 10:00:00',
    '2025-02-05 14:00:00',
    'KwaZulu-Natal',
    'Online - Microsoft Teams',
    3,
    'Clinical Associates',
    80,
    3, -- Completed
    'Inkosi Albert Luthuli Central Hospital',
    'Blood pressure measurement, antihypertensive medications, lifestyle modifications',
    'BP Measurement Video Guide, Medication Reference Chart',
    0,
    GETDATE(),
    'system'
),
-- Session 4
(
    'Cardiovascular Disease Prevention',
    'NDC Training Workshop',
    '2025-02-12 08:30:00',
    '2025-02-14 16:30:00',
    'Eastern Cape',
    'East London ICC',
    1,
    'General Practitioners',
    35,
    3, -- Completed
    'Frere Hospital',
    'CVD risk assessment, primary prevention strategies, referral pathways',
    'CVD Risk Calculator, Treatment Algorithms, Referral Forms',
    0,
    GETDATE(),
    'system'
),
-- Session 5
(
    'Mental Health in NCD Patients',
    'Virtual Training',
    '2025-02-20 09:00:00',
    '2025-02-20 13:00:00',
    'Free State',
    'Online - Zoom',
    2,
    'Psychologists and Counsellors',
    55,
    3, -- Completed
    'Universitas Academic Hospital',
    'Depression screening in chronic disease, integrated care approach',
    'PHQ-9 Screening Tool, Counselling Guidelines',
    0,
    GETDATE(),
    'system'
),
-- Session 6
(
    'Chronic Respiratory Disease Management',
    'NDC Training Workshop',
    '2025-03-03 08:00:00',
    '2025-03-05 17:00:00',
    'Mpumalanga',
    'Mbombela Civic Centre',
    3,
    'Respiratory Therapists',
    40,
    3, -- Completed
    'Rob Ferreira Hospital',
    'COPD and Asthma management, spirometry interpretation, inhaler techniques',
    'Spirometry Training Module, Inhaler Demonstration Devices',
    0,
    GETDATE(),
    'system'
),
-- Session 7
(
    'Cancer Screening and Early Detection',
    'NDC Training Workshop',
    '2025-03-17 09:00:00',
    '2025-03-19 16:00:00',
    'Limpopo',
    'Polokwane Conference Centre',
    1,
    'Oncology Nurses',
    30,
    3, -- Completed
    'Pietersburg Hospital',
    'Breast, cervical, and prostate cancer screening protocols',
    'Screening Guidelines, Referral Pathways, Patient Information Sheets',
    0,
    GETDATE(),
    'system'
),
-- Session 8
(
    'Nutrition and NCDs',
    'Virtual Training',
    '2025-03-25 10:00:00',
    '2025-03-25 15:00:00',
    'North West',
    'Online - Microsoft Teams',
    2,
    'Dietitians and Nutritionists',
    70,
    3, -- Completed
    'Klerksdorp Hospital',
    'Dietary interventions for diabetes, hypertension, and obesity',
    'Meal Planning Templates, Portion Control Guides',
    0,
    GETDATE(),
    'system'
),
-- Session 9
(
    'Paediatric NCD Prevention',
    'NDC Training Workshop',
    '2025-04-07 08:30:00',
    '2025-04-09 16:30:00',
    'Northern Cape',
    'Kimberley City Hall',
    3,
    'Paediatric Nurses',
    25,
    3, -- Completed
    'Kimberley Hospital Complex',
    'Childhood obesity prevention, type 1 diabetes management in children',
    'Growth Charts, Paediatric NCD Guidelines',
    0,
    GETDATE(),
    'system'
),
-- Session 10
(
    'NCD Data Management and Reporting',
    'Virtual Training',
    '2025-04-15 09:00:00',
    '2025-04-15 13:00:00',
    'Western Cape',
    'Online - Zoom',
    1,
    'Health Information Officers',
    90,
    3, -- Completed
    'Tygerberg Hospital',
    'NCD register management, data quality, reporting requirements',
    'Data Collection Forms, DHIS Training Manual',
    0,
    GETDATE(),
    'system'
),
-- Session 11
(
    'Integrated Chronic Disease Management',
    'NDC Training Workshop',
    '2025-05-05 08:00:00',
    '2025-05-07 17:00:00',
    'Gauteng',
    'Pretoria Showgrounds',
    2,
    'Primary Healthcare Teams',
    50,
    3, -- Completed
    'Steve Biko Academic Hospital',
    'ICDM model implementation, multi-morbidity management',
    'ICDM Guidelines, Patient Flow Charts, Booking System Guide',
    0,
    GETDATE(),
    'system'
),
-- Session 12
(
    'Stroke Prevention and Rehabilitation',
    'NDC Training Workshop',
    '2025-05-19 09:00:00',
    '2025-05-21 16:00:00',
    'KwaZulu-Natal',
    'Durban ICC',
    3,
    'Physiotherapists and OTs',
    38,
    3, -- Completed
    'King Edward VIII Hospital',
    'Stroke risk factors, acute management, rehabilitation techniques',
    'Stroke Care Pathway, Rehabilitation Exercises Guide',
    0,
    GETDATE(),
    'system'
),
-- Session 13
(
    'Kidney Disease and NCDs',
    'Virtual Training',
    '2025-06-02 10:00:00',
    '2025-06-02 14:00:00',
    'Eastern Cape',
    'Online - Microsoft Teams',
    1,
    'Nephrology Nurses',
    65,
    3, -- Completed
    'Livingstone Hospital',
    'CKD screening, dialysis preparation, transplant education',
    'CKD Staging Chart, Dietary Restrictions Guide',
    0,
    GETDATE(),
    'system'
),
-- Session 14
(
    'Eye Health and Diabetes',
    'NDC Training Workshop',
    '2025-06-16 08:30:00',
    '2025-06-17 16:30:00',
    'Free State',
    'Bloemfontein Conference Centre',
    2,
    'Ophthalmology Staff',
    28,
    3, -- Completed
    'Pelonomi Hospital',
    'Diabetic retinopathy screening, vision preservation strategies',
    'Retinal Screening Protocol, Patient Education Materials',
    0,
    GETDATE(),
    'system'
),
-- Session 15
(
    'Tobacco Cessation Counselling',
    'Virtual Training',
    '2025-07-01 09:00:00',
    '2025-07-01 13:00:00',
    'Mpumalanga',
    'Online - Zoom',
    3,
    'All Healthcare Workers',
    120,
    3, -- Completed
    'Witbank Hospital',
    'Motivational interviewing, NRT prescription, relapse prevention',
    'Quit Smoking Guide, NRT Dosing Chart',
    0,
    GETDATE(),
    'system'
),
-- Session 16
(
    'Alcohol and Substance Abuse in NCDs',
    'NDC Training Workshop',
    '2025-07-14 08:00:00',
    '2025-07-16 17:00:00',
    'Limpopo',
    'Tzaneen Civic Centre',
    1,
    'Social Workers and Counsellors',
    42,
    3, -- Completed
    'Letaba Hospital',
    'Screening for alcohol abuse, brief interventions, referral pathways',
    'AUDIT Questionnaire, Brief Intervention Guide',
    0,
    GETDATE(),
    'system'
),
-- Session 17
(
    'NCD Management in Pregnancy',
    'NDC Training Workshop',
    '2025-08-04 09:00:00',
    '2025-08-06 16:00:00',
    'North West',
    'Rustenburg Civic Centre',
    2,
    'Midwives and OB Nurses',
    35,
    3, -- Completed
    'Job Shimankana Tabane Hospital',
    'Gestational diabetes, pregnancy-induced hypertension, postpartum care',
    'Antenatal NCD Protocol, GDM Management Guide',
    0,
    GETDATE(),
    'system'
),
-- Session 18
(
    'Palliative Care for NCD Patients',
    'Virtual Training',
    '2025-08-18 10:00:00',
    '2025-08-18 15:00:00',
    'Northern Cape',
    'Online - Microsoft Teams',
    3,
    'Palliative Care Teams',
    55,
    3, -- Completed
    'Robert Sobukwe Hospital',
    'End-of-life care, pain management, family support',
    'Palliative Care Guidelines, Pain Assessment Tools',
    0,
    GETDATE(),
    'system'
),
-- Session 19
(
    'Physical Activity Prescription',
    'NDC Training Workshop',
    '2025-09-01 08:30:00',
    '2025-09-02 16:30:00',
    'Western Cape',
    'Stellenbosch University Conference Centre',
    1,
    'Biokineticists and Exercise Specialists',
    32,
    3, -- Completed
    'Karl Bremer Hospital',
    'Exercise prescription for chronic conditions, safety considerations',
    'Exercise Prescription Forms, Contraindication Checklist',
    0,
    GETDATE(),
    'system'
),
-- Session 20
(
    'Community-Based NCD Prevention',
    'NDC Training Workshop',
    '2025-09-15 09:00:00',
    '2025-09-17 17:00:00',
    'Gauteng',
    'Soweto Theatre',
    2,
    'Community Health Workers',
    75,
    3, -- Completed
    'Chris Hani Baragwanath Hospital',
    'Community outreach, health promotion, screening campaigns',
    'Community Screening Kit, Health Talk Presentations',
    0,
    GETDATE(),
    'system'
),
-- Session 21 - Upcoming/Scheduled
(
    'Advanced Diabetes Insulin Management',
    'NDC Training Workshop',
    '2025-12-01 08:00:00',
    '2025-12-03 17:00:00',
    'KwaZulu-Natal',
    'Pietermaritzburg City Hall',
    3,
    'Diabetes Educators',
    40,
    1, -- Scheduled
    'Grey''s Hospital',
    'Insulin pump therapy, CGM interpretation, dose adjustments',
    'Insulin Therapy Manual, CGM Training Videos',
    0,
    GETDATE(),
    'system'
),
-- Session 22 - Upcoming/Scheduled
(
    'NCD Quality Improvement Workshop',
    'Virtual Training',
    '2025-12-08 09:00:00',
    '2025-12-08 14:00:00',
    'Eastern Cape',
    'Online - Zoom',
    1,
    'Facility Managers',
    60,
    1, -- Scheduled
    'Dora Nginza Hospital',
    'Quality indicators, audit processes, improvement cycles',
    'QI Tools, Audit Templates, Action Plan Forms',
    0,
    GETDATE(),
    'system'
),
-- Session 23 - Upcoming/Scheduled
(
    'Hypertension Medication Update 2025',
    'Virtual Training',
    '2025-12-10 10:00:00',
    '2025-12-10 13:00:00',
    'Free State',
    'Online - Microsoft Teams',
    2,
    'Pharmacists and Prescribers',
    100,
    1, -- Scheduled
    'National Hospital',
    'New antihypertensive agents, drug interactions, adherence strategies',
    'Updated Treatment Guidelines, Drug Interaction Chart',
    0,
    GETDATE(),
    'system'
),
-- Session 24 - In Progress
(
    'Integrated NCD-HIV Care',
    'NDC Training Workshop',
    '2025-11-24 08:00:00',
    '2025-11-28 17:00:00',
    'Mpumalanga',
    'Nelspruit Conference Centre',
    3,
    'HIV Clinicians and NCD Specialists',
    45,
    2, -- In Progress
    'Rob Ferreira Hospital',
    'Managing NCDs in HIV patients, drug interactions, monitoring',
    'HIV-NCD Integration Manual, Monitoring Checklist',
    0,
    GETDATE(),
    'system'
),
-- Session 25 - Scheduled
(
    'Obesity Management Strategies',
    'NDC Training Workshop',
    '2025-12-15 09:00:00',
    '2025-12-17 16:00:00',
    'Limpopo',
    'Thohoyandou Community Hall',
    1,
    'Dietitians and GPs',
    38,
    1, -- Scheduled
    'Donald Fraser Hospital',
    'Obesity assessment, behavioural interventions, bariatric surgery referrals',
    'BMI Charts, Behavioural Therapy Manual',
    0,
    GETDATE(),
    'system'
),
-- Session 26 - Cancelled
(
    'NCD Leadership Summit',
    'NDC Training Workshop',
    '2025-10-20 08:00:00',
    '2025-10-22 17:00:00',
    'Gauteng',
    'Sandton Convention Centre',
    2,
    'District Health Managers',
    50,
    4, -- Cancelled
    'Helen Joseph Hospital',
    'Strategic planning, resource allocation, performance monitoring',
    'Strategic Planning Template, Budget Guidelines',
    0,
    GETDATE(),
    'system'
),
-- Session 27 - Scheduled
(
    'Telemedicine for NCD Care',
    'Virtual Training',
    '2026-01-12 10:00:00',
    '2026-01-12 15:00:00',
    'North West',
    'Online - Microsoft Teams',
    3,
    'Telehealth Coordinators',
    85,
    1, -- Scheduled
    'Mahikeng Provincial Hospital',
    'Virtual consultation skills, technology setup, patient consent',
    'Telemedicine Guidelines, Technical Setup Manual',
    0,
    GETDATE(),
    'system'
),
-- Session 28 - Scheduled
(
    'NCD Emergency Protocols',
    'NDC Training Workshop',
    '2026-01-20 08:30:00',
    '2026-01-22 16:30:00',
    'Northern Cape',
    'Upington Training Centre',
    1,
    'Emergency Department Staff',
    30,
    1, -- Scheduled
    'Upington Hospital',
    'Hypertensive crisis, diabetic emergencies, stroke response',
    'Emergency Protocols, Quick Reference Cards',
    0,
    GETDATE(),
    'system'
),
-- Session 29 - Scheduled
(
    'Adolescent NCD Prevention',
    'Virtual Training',
    '2026-02-03 09:00:00',
    '2026-02-03 14:00:00',
    'Western Cape',
    'Online - Zoom',
    2,
    'School Health Nurses',
    95,
    1, -- Scheduled
    'Red Cross War Memorial Children''s Hospital',
    'Youth-friendly services, school screening, health promotion',
    'Youth NCD Guide, School Screening Protocol',
    0,
    GETDATE(),
    'system'
),
-- Session 30 - Scheduled
(
    'NCD Refresher Training 2026',
    'NDC Training Workshop',
    '2026-02-17 08:00:00',
    '2026-02-19 17:00:00',
    'KwaZulu-Natal',
    'Richards Bay Civic Centre',
    3,
    'All PHC Staff',
    65,
    1, -- Scheduled
    'Ngwelezana Hospital',
    'Annual update on NCD guidelines, new protocols, case discussions',
    'Updated NCD Manual, Case Study Booklet',
    0,
    GETDATE(),
    'system'
);

PRINT '';
PRINT '====================================';
PRINT 'Training Sessions Seeder Complete!';
PRINT '30 records inserted successfully.';
PRINT '';
PRINT 'Summary by Status:';
PRINT '- Scheduled (1): 10 sessions';
PRINT '- In Progress (2): 1 session';
PRINT '- Completed (3): 18 sessions';
PRINT '- Cancelled (4): 1 session';
PRINT '';
PRINT 'Summary by Province:';
PRINT '- Western Cape: 4 sessions';
PRINT '- Gauteng: 4 sessions';
PRINT '- KwaZulu-Natal: 4 sessions';
PRINT '- Eastern Cape: 3 sessions';
PRINT '- Free State: 3 sessions';
PRINT '- Mpumalanga: 3 sessions';
PRINT '- Limpopo: 3 sessions';
PRINT '- North West: 3 sessions';
PRINT '- Northern Cape: 3 sessions';
PRINT '====================================';

-- Verify inserted records
SELECT 
    COUNT(*) AS TotalRecords,
    SUM(CASE WHEN Status = 1 THEN 1 ELSE 0 END) AS Scheduled,
    SUM(CASE WHEN Status = 2 THEN 1 ELSE 0 END) AS InProgress,
    SUM(CASE WHEN Status = 3 THEN 1 ELSE 0 END) AS Completed,
    SUM(CASE WHEN Status = 4 THEN 1 ELSE 0 END) AS Cancelled
FROM TrainingSession
WHERE IsDeleted = 0;
