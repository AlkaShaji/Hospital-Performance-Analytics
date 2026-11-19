USE hospital_analytics;


SELECT
    d.department_name,
    COUNT(a.admission_id) AS total_admissions
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_admissions DESC;

