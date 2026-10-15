USE [HospitalDB];
GO

-- 1. Insert Roles
SET IDENTITY_INSERT [dbo].[Roles] ON;
INSERT INTO [dbo].[Roles] ([RoleID], [RoleName])
VALUES 
    (1, 'Admin'),
    (2, 'Doctor'),
    (3, 'Cashier'),
    (4, 'Patient');
SET IDENTITY_INSERT [dbo].[Roles] OFF;
GO

-- 2. Insert Users (Admin, 4 Doctors, 2 Cashiers, 8 Patients)
-- Note: The application matches plain-text password in Users table
SET IDENTITY_INSERT [dbo].[Users] ON;
INSERT INTO [dbo].[Users] ([UserID], [UserName], [Password], [RoleID])
VALUES
    -- Admin
    (1, 'admin', 'Admin@123', 1),
    
    -- Doctors (RoleID = 2)
    (2, 'dr_sarah', 'Doctor@123', 2),
    (3, 'dr_robert', 'Doctor@123', 2),
    (4, 'dr_emily', 'Doctor@123', 2),
    (5, 'dr_michael', 'Doctor@123', 2),
    
    -- Cashiers (RoleID = 3)
    (6, 'cashier_james', 'Cashier@123', 3),
    (7, 'cashier_lisa', 'Cashier@123', 3),
    
    -- Patients (RoleID = 4)
    (8,  'patient_john',    'Patient@123', 4),
    (9,  'patient_jane',    'Patient@123', 4),
    (10, 'patient_david',   'Patient@123', 4),
    (11, 'patient_mary',    'Patient@123', 4),
    (12, 'patient_william', 'Patient@123', 4),
    (13, 'patient_olivia',  'Patient@123', 4),
    (14, 'patient_jamesjr', 'Patient@123', 4),
    (15, 'patient_sophia',  'Patient@123', 4);
SET IDENTITY_INSERT [dbo].[Users] OFF;
GO

-- 3. Insert Doctors
SET IDENTITY_INSERT [dbo].[Doctors] ON;
INSERT INTO [dbo].[Doctors] ([DoctorID], [UserID], [DoctorName], [Specialization], [Phone], [Age])
VALUES
    (1, 2, 'Dr. Sarah Jenkins', 'Cardiology',   '01711000001', 42),
    (2, 3, 'Dr. Robert Chen',   'Neurology',    '01711000002', 48),
    (3, 4, 'Dr. Emily Taylor',  'Pediatrics',   '01711000003', 36),
    (4, 5, 'Dr. Michael Adams', 'Orthopedics',  '01711000004', 50);
SET IDENTITY_INSERT [dbo].[Doctors] OFF;
GO

-- 4. Insert Cashiers
SET IDENTITY_INSERT [dbo].[Cashiers] ON;
INSERT INTO [dbo].[Cashiers] ([CashierID], [UserID], [CashierName], [Age], [Specialization])
VALUES
    (1, 6, 'James Wilson', 29, 'Billing Specialist'),
    (2, 7, 'Lisa Brown',   32, 'Accounts Senior');
SET IDENTITY_INSERT [dbo].[Cashiers] OFF;
GO

-- 5. Insert Patients
SET IDENTITY_INSERT [dbo].[Patients] ON;
INSERT INTO [dbo].[Patients] ([PatientID], [UserID], [PatientName], [Age], [Gender], [BloodGroup], [MedicalHistory])
VALUES
    (1, 8,  'John Doe',          35, 'Male',   'A+',  'Hypertension, Seasonal Allergies'),
    (2, 9,  'Jane Smith',        28, 'Female', 'O+',  'Mild Asthma, Migraines'),
    (3, 10, 'David Miller',      52, 'Male',   'B+',  'Type 2 Diabetes, High Cholesterol'),
    (4, 11, 'Mary Johnson',      45, 'Female', 'AB+', 'Hyperthyroidism'),
    (5, 12, 'William Brown',     61, 'Male',   'O-',  'Coronary Artery Disease, Stent Placement (2022)'),
    (6, 13, 'Olivia Davis',      23, 'Female', 'A-',  'No chronic illnesses, occasional acid reflux'),
    (7, 14, 'James Wilson Jr',   31, 'Male',   'B-',  'Fractured left tibia repaired in 2024'),
    (8, 15, 'Sophia Martinez',   39, 'Female', 'AB-', 'Chronic Sinusitis, Penicillin allergy');
SET IDENTITY_INSERT [dbo].[Patients] OFF;
GO

-- 6. Insert Appointments (10 appointments)
SET IDENTITY_INSERT [dbo].[Appointments] ON;
INSERT INTO [dbo].[Appointments] ([AppointmentID], [PatientID], [DoctorID], [AppointmentDate], [Status], [StartTime], [EndTime])
VALUES
    (1,  1, 1, '2026-10-16 09:00:00', 'Completed', '09:00:00', '09:30:00'),
    (2,  2, 3, '2026-10-16 10:00:00', 'Completed', '10:00:00', '10:30:00'),
    (3,  3, 1, '2026-10-17 09:30:00', 'Booked',    '09:30:00', '10:00:00'),
    (4,  4, 2, '2026-10-17 11:00:00', 'Booked',    '11:00:00', '11:30:00'),
    (5,  5, 1, '2026-10-18 14:00:00', 'Pending',   '14:00:00', '14:30:00'),
    (6,  6, 3, '2026-10-18 15:00:00', 'Booked',    '15:00:00', '15:30:00'),
    (7,  7, 4, '2026-10-19 10:00:00', 'Booked',    '10:00:00', '10:30:00'),
    (8,  8, 2, '2026-10-19 11:30:00', 'Completed', '11:30:00', '12:00:00'),
    (9,  1, 4, '2026-10-20 16:00:00', 'Pending',   '16:00:00', '16:30:00'),
    (10, 2, 1, '2026-10-21 09:00:00', 'Booked',    '09:00:00', '09:30:00');
SET IDENTITY_INSERT [dbo].[Appointments] OFF;
GO

-- 7. Insert Prescriptions (6 prescriptions)
SET IDENTITY_INSERT [dbo].[Prescriptions] ON;
INSERT INTO [dbo].[Prescriptions] ([PrescriptionID], [PatientID], [DoctorID], [PrescriptionDate], [Diagnosis], [Notes])
VALUES
    (1, 1, 1, '2026-10-16 09:25:00', 'Stage 1 Essential Hypertension', 'Maintain low sodium diet and exercise 30 mins daily.'),
    (2, 2, 3, '2026-10-16 10:25:00', 'Acute Bronchial Asthma Exacerbation', 'Avoid cold weather and dust triggers. Use inhaler before exercise.'),
    (3, 3, 1, '2026-10-10 11:15:00', 'Type 2 Diabetes Mellitus with Dyslipidemia', 'Check fasting glucose bi-weekly. Avoid processed sugars.'),
    (4, 5, 1, '2026-10-12 14:45:00', 'Stable Angina Pectoris', 'Take aspirin with meals. Report any chest heaviness immediately.'),
    (5, 7, 4, '2026-10-14 10:30:00', 'Post-Traumatic Tibial Tendonitis', 'Apply cold compress twice daily and avoid high-impact activities.'),
    (6, 8, 2, '2026-10-15 11:50:00', 'Tension-Type Headache & Chronic Sinusitis', 'Stay hydrated and ensure 8 hours of sleep.');
SET IDENTITY_INSERT [dbo].[Prescriptions] OFF;
GO

-- 8. Insert Prescription Medicines
SET IDENTITY_INSERT [dbo].[PrescriptionMedicines] ON;
INSERT INTO [dbo].[PrescriptionMedicines] ([PrescriptionMedicineID], [PrescriptionID], [MedicineName], [Dosage], [Frequency], [Duration])
VALUES
    -- For Prescription 1
    (1, 1, 'Amlodipine', '5mg', 'Once daily (Morning)', '30 days'),
    (2, 1, 'Hydrochlorothiazide', '12.5mg', 'Once daily', '30 days'),
    -- For Prescription 2
    (3, 2, 'Salbutamol Inhaler', '100mcg', '2 puffs as needed', '15 days'),
    (4, 2, 'Montelukast', '10mg', 'Once daily at bedtime', '30 days'),
    -- For Prescription 3
    (5, 3, 'Metformin', '500mg', 'Twice daily after meals', '60 days'),
    (6, 3, 'Atorvastatin', '20mg', 'Once daily at night', '60 days'),
    -- For Prescription 4
    (7, 4, 'Aspirin', '75mg', 'Once daily after lunch', '90 days'),
    (8, 4, 'Metoprolol', '50mg', 'Once daily', '30 days'),
    -- For Prescription 5
    (9, 5, 'Naproxen', '250mg', 'Twice daily after meals', '7 days'),
    -- For Prescription 6
    (10, 6, 'Paracetamol', '500mg', 'Three times daily', '5 days'),
    (11, 6, 'Fluticasone Nasal Spray', '50mcg', '1 spray each nostril daily', '14 days');
SET IDENTITY_INSERT [dbo].[PrescriptionMedicines] OFF;
GO

-- 9. Insert Bills & BillItems (CashierID references Users.UserID)
SET IDENTITY_INSERT [dbo].[Bills] ON;
INSERT INTO [dbo].[Bills] ([BillID], [PatientID], [CashierID], [BillDate], [TotalAmount], [PaymentMethod])
VALUES
    (1, 1, 6, '2026-10-16 09:40:00', 120.00, 'Cash'),
    (2, 2, 6, '2026-10-16 10:45:00', 85.50,  'Credit Card'),
    (3, 3, 7, '2026-10-10 11:30:00', 210.00, 'Debit Card'),
    (4, 8, 7, '2026-10-15 12:15:00', 95.00,  'Cash');
SET IDENTITY_INSERT [dbo].[Bills] OFF;
GO

SET IDENTITY_INSERT [dbo].[BillItems] ON;
INSERT INTO [dbo].[BillItems] ([BillItemID], [BillID], [ItemName], [Quantity], [Price])
VALUES
    (1, 1, 'Cardiology Consultation', 1, 80.00),
    (2, 1, 'ECG Test', 1, 40.00),
    (3, 2, 'Pediatrics Consultation', 1, 60.00),
    (4, 2, 'Nebulization Therapy', 1, 25.50),
    (5, 3, 'Specialist Consultation', 1, 90.00),
    (6, 3, 'HbA1c Blood Panel', 1, 70.00),
    (7, 3, 'Lipid Profile', 1, 50.00),
    (8, 4, 'Neurology Consultation', 1, 80.00),
    (9, 4, 'Sinus Diagnostic Examination', 1, 15.00);
SET IDENTITY_INSERT [dbo].[BillItems] OFF;
GO
