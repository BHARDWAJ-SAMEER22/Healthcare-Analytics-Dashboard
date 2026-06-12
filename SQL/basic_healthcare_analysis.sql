SELECT COUNT(*) FROM patients;

SELECT COUNT(*) FROM doctors;

SELECT COUNT(*) FROM appointments;

SELECT COUNT(*) FROM treatments;

SELECT COUNT(*) FROM billing;


DESCRIBE patients;


DESCRIBE doctors;
DESCRIBE appointments;
DESCRIBE treatments;
DESCRIBE billing;


select *from doctors limit 10;

select* from appointments limit 10;

SELECT ROUND(SUM(amount),2) AS total_revenue
FROM billing;




SELECT
gender,
COUNT(*) AS patient_count
FROM patients
GROUP BY gender;

SELECT
status,
COUNT(*) AS total
FROM appointments
GROUP BY status;

SELECT
MONTH(appointment_date) AS month_no,
COUNT(*) AS total_appointments
FROM appointments
GROUP BY MONTH(appointment_date)
ORDER BY month_no;


SELECT
d.first_name,
d.last_name,
COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id,d.first_name,d.last_name
ORDER BY total_appointments DESC;

SELECT
d.specialization,
COUNT(*) AS total_appointments
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.specialization
ORDER BY total_appointments DESC;


SELECT
t.treatment_type,
ROUND(SUM(b.amount),2) AS revenue
FROM treatments t
JOIN billing b
ON t.treatment_id = b.treatment_id
GROUP BY t.treatment_type
ORDER BY revenue DESC;


SELECT
treatment_type,
ROUND(AVG(cost),2) AS avg_cost
FROM treatments
GROUP BY treatment_type;


SELECT COUNT(*) AS total_patients
FROM patients;

SELECT
    insurance_provider,
    COUNT(*) AS patient_count
FROM patients
GROUP BY insurance_provider
ORDER BY patient_count DESC;

SELECT
    d.first_name,
    d.last_name,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id,d.first_name,d.last_name
ORDER BY total_appointments DESC;


SELECT
    treatment_type,
    COUNT(*) AS total_treatments
FROM treatments
GROUP BY treatment_type
ORDER BY total_treatments DESC;


SELECT
    payment_method,
    ROUND(SUM(amount),2) AS revenue
FROM billing
GROUP BY payment_method
ORDER BY revenue DESC;



CREATE VIEW vw_patient_appointments AS
SELECT
    p.patient_id,
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    p.gender,
    a.appointment_id,
    a.appointment_date,
    a.status
FROM patients p
JOIN appointments a
ON p.patient_id = a.patient_id;


SELECT * FROM vw_patient_appointments;


CREATE VIEW vw_doctor_performance AS
SELECT
    d.doctor_id,
    CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    d.specialization,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY
    d.doctor_id,
    d.first_name,
    d.last_name,
    d.specialization;
    
    
    SELECT * FROM vw_doctor_performance;
    
    CREATE VIEW vw_revenue_summary AS
SELECT
    payment_method,
    payment_status,
    SUM(amount) AS total_revenue
FROM billing
GROUP BY payment_method, payment_status;
    
    
    SELECT * FROM vw_revenue_summary;
    
    
    
    