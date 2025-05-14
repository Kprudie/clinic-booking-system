# Clinic Booking System (MySQL Project)

## Overview
This project is a simple *Clinic Booking System* implemented using MySQL. It is designed to demonstrate database design and SQL query skills, including proper table creation with constraints, relationships, sample data insertion, and data querying.

## Objective
To design and implement a full-featured relational database using only SQL that supports:
- Managing patients and doctors
- Organizing medical departments
- Booking appointments

## Schema Design

### Tables and Relationships

1. patients
   - patient_id (Primary Key)
   - first_name, last_name, gender, date_of_birth
   - phone, email, address

2. doctors
   - doctor_id (Primary Key)
   - first_name, last_name
   - department_id (Foreign Key to departments)
   - phone, email

3. departments
   - department_id (Primary Key)
   - department_name

4. appointments
   - appointment_id (Primary Key)
   - patient_id (Foreign Key to patients)
   - doctor_id (Foreign Key to doctors)
   - appointment_date, appointment_time, status

## Sample Data
The database includes sample data for:
- departments
- doctors
- patients
- appointments

## Sample Queries

1. List all appointments with patient and doctor names.
2. Show all doctors in the “Pediatrics” department.
3. List patients born after the year 2000.

## How to Run
1. Open MySQL Workbench or any SQL editor.
2. Run the SQL script (clinic_booking_system.sql) to create and populate the database.
3. Use the sample queries to interact with the data.

