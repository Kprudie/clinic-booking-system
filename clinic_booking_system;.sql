Create database clinic_booking_system;
use clinic_booking_system;
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100),
    address TEXT
);
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT,
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
-- for clinic staff login--
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Receptionist', 'Doctor') NOT NULL
);
-- Insert into departments
INSERT INTO departments (department_name) VALUES 
('Cardiology'), 
('Dermatology'), 
('Pediatrics');

-- Insert into patients
INSERT INTO patients (first_name, last_name, gender, date_of_birth, phone, email, address) VALUES 
('Alice', 'Mumo', 'Female', '1990-05-21', '0712345678', 'alice@example.com', 'Nairobi, Kenya'),
('Brian', 'Odhiambo', 'Male', '1985-03-15', '0723456789', 'brian@example.com', 'Kisumu, Kenya'),
('Cynthia', 'Wanjiru', 'Female', '2001-09-12', '0734567890', 'cynthia@example.com', 'Nakuru, Kenya');

-- Insert into doctors
INSERT INTO doctors (first_name, last_name, department_id, phone, email) VALUES 
('Dr. John', 'Mwangi', 1, '07801111', 'john.mwangi@clinic.com'),
('Dr. Aisha', 'Abdi', 2, '0746502222', 'aisha.abdi@clinic.com'),
('Dr. Peter', 'Mutua', 3, '0721303333', 'peter.mutua@clinic.com');

-- Insert into appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES 
(1, 1, '2025-05-20', '10:00:00', 'Scheduled'),
(2, 2, '2025-05-21', '11:30:00', 'Completed'),
(3, 3, '2025-05-22', '09:00:00', 'Cancelled');
-- get a list of all appointments with patient and doctor names
SELECT 
    a.appointment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;
-- show all doctors in pediatrics depart
SELECT 
    d.first_name, 
    d.last_name, 
    dep.department_name
FROM doctors d
JOIN departments dep ON d.department_id = dep.department_id
WHERE dep.department_name = 'Pediatrics';
-- list  patients born after 2000
SELECT 
    first_name, 
    last_name, 
    date_of_birth
FROM patients
WHERE date_of_birth > '2000-01-01';
