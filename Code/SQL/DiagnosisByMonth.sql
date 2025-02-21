-- Alter column and truncate date data to find number of disnosis by month

ALTER TABLE ocd_patient_data 
ALTER COLUMN "OCD Diagnosis Date" TYPE DATE 
USING TO_DATE("OCD Diagnosis Date", 'YYYY/MM/DD');


SELECT 
    DATE_TRUNC('month', "OCD Diagnosis Date") AS month, 
    COUNT("Patient ID") AS patient_count
FROM ocd_patient_data
GROUP BY 1
ORDER BY 1;