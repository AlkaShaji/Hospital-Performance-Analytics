CREATE DATABASE hospital_analytics;
SHOW DATABASES;
USE hospital_analytics;

CREATE TABLE patients (
    patient_id VARCHAR(10) PRIMARY KEY,
    age INT,
    gender VARCHAR(10)
);


CREATE TABLE departments (
    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);


CREATE TABLE admissions (
    admission_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10) NOT NULL,
    department_id VARCHAR(10) NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE NULL,
    admission_type VARCHAR(20),
    status VARCHAR(20),

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);


SHOW TABLES

DESCRIBE patients;

DESCRIBE departments;
DESCRIBE admissions;


SHOW CREATE TABLE admissions;

INSERT INTO departments
(department_id, department_name)
VALUES
('UNKNOWN', 'Department Not Specified');


SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'hospital_analytics'
AND REFERENCED_TABLE_NAME IS NOT NULL;


SELECT *
FROM departments
WHERE department_id = 'UNKNOWN';


SELECT COUNT(*) FROM patients;
SELECT * FROM patients LIMIT 10;

SELECT COUNT(*) FROM departments;
SELECT * FROM departments LIMIT 10;

SELECT COUNT(*) FROM admissions;

SELECT DATABASE();

DESCRIBE admissions;

SELECT COUNT(*)
FROM admissions;


SELECT status, COUNT(*)
FROM admissions
GROUP BY status;

SELECT COUNT(*)
FROM admissions
WHERE discharge_date IS NULL;



CREATE TABLE admissions_staging (
    admission_id VARCHAR(10),
    patient_id VARCHAR(10),
    department_id VARCHAR(10),
    admission_date VARCHAR(20),
    discharge_date VARCHAR(20),
    admission_type VARCHAR(20),
    status VARCHAR(20)
);

admissions_staging
DESCRIBE admissions_staging;


SELECT COUNT(*)
FROM admissions_staging;

SELECT status, COUNT(*)
FROM admissions_staging
GROUP BY status;

SELECT COUNT(*)
FROM admissions_staging
WHERE discharge_date IS NULL
   OR discharge_date = '';
   
   
SELECT admission_id, COUNT(*)
FROM admissions_staging
GROUP BY admission_id
HAVING COUNT(*) > 1;


SELECT s.admission_id
FROM admissions_staging s
INNER JOIN admissions a
ON s.admission_id = a.admission_id;


SELECT admission_id, admission_date
FROM admissions_staging
LIMIT 10;

SELECT s.patient_id
FROM admissions_staging s
LEFT JOIN patients p
ON s.patient_id = p.patient_id
WHERE p.patient_id IS NULL;


SELECT s.department_id
FROM admissions_staging s
LEFT JOIN departments d
ON s.department_id = d.department_id
WHERE d.department_id IS NULL;



INSERT INTO admissions (
    admission_id,
    patient_id,
    department_id,
    admission_date,
    discharge_date,
    admission_type,
    status
)
SELECT
    admission_id,
    patient_id,
    department_id,
    STR_TO_DATE(admission_date, '%Y-%m-%d'),
    STR_TO_DATE(NULLIF(discharge_date, ''), '%Y-%m-%d'),
    admission_type,
    status
FROM admissions_staging;


SELECT COUNT(*)
FROM admissions;



SELECT status, COUNT(*) AS total
FROM admissions
GROUP BY status;

SELECT COUNT(*) AS active_admissions
from admissions
where discharge_date IS NULL;


SELECT
    MIN(admission_date) AS first_admission,
    MAX(admission_date) AS last_admission
FROM admissions;