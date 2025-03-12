Select * FROM ocd_patient_data;

-- 1. Medications perscribed
SELECT 
	medications,
	COUNT(*) as times_perscribed
FROM
	ocd_patient_data
GROUP BY 
	medications;

-- 2. Medication & Symptom Severity
Select 
	Distinct medications,
	obsession_type,
	AVG(y_bocs_score_o) as avg_obsession_score,
	compulsion_type,
	AVG(y_bocs_score_c) as avg_compulsion_score
FROM 
	ocd_patient_data
GROUP BY 
	medications,
	obsession_type,
	compulsion_type
Order by 1;

-- 3. Symptom duration and treatments
Select 
	patient_id,
	duration_of_symptoms_months,
	medications 
FROM 
	ocd_patient_data
Order by 
	2 DESC;

-- 4. Medication demographics
SELECT
    medications,
    --age,
    gender,
    ethnicity,
    marital_status,
    COUNT(*) AS prescription_count
FROM
    ocd_patient_data
GROUP BY
    medications,
    --age,
    gender,
    ethnicity,
    marital_status
ORDER BY
    medications;


