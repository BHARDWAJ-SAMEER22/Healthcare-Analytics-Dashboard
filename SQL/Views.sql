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