SELECT 
	patient_id, 
	age,
	gender,
	ethnicity,
	education_level,
	marital_status,
	obsession_type,
	y_bocs_score_o,
	compulsion_type,
	y_bocs_score_c
FROM 
    ocd_patient_data
Order by 
    2;



SELECT * FROM public.ocd_patient_data

-- 1. Age Distribution	
SELECT 
    CASE 
        WHEN age BETWEEN 0 AND 20 THEN '0-20'
        WHEN age BETWEEN 21 AND 30 THEN '21-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
		WHEN age BETWEEN 51 AND 60 THEN '41-50'
        ELSE '60+' END AS age_group,
    COUNT(*) AS patient_count
FROM 
    ocd_patient_data
GROUP BY 
    age_group
ORDER BY 
    age_group;

2. Y-BOCS Symptom Severity 

SELECT 
    CASE 
        WHEN age BETWEEN 0 AND 20 THEN '0-20'
        WHEN age BETWEEN 21 AND 30 THEN '21-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
		WHEN age BETWEEN 51 AND 60 THEN '41-50'
        ELSE '60+' END AS age_group,
    ROUND(AVG(y_bocs_score_o),3) AS avg_obsession_score,
    ROUND(AVG(y_bocs_score_c),3) AS avg_compulsion_score,
    ROUND(AVG(y_bocs_score_o + y_bocs_score_c),3) AS avg_total_score
FROM 
    ocd_patient_data
GROUP BY 
    age_group
ORDER BY 
    avg_total_score DESC;

-- 3. Gender Influence on Type or Severity of Symptoms

SELECT 
    gender,
    ROUND(AVG(y_bocs_score_o),3) AS avg_obsession_score,
    ROUND(AVG(y_bocs_score_c),3) AS avg_compulsion_score,
    ROUND(AVG(y_bocs_score_o + y_bocs_score_c),3) AS avg_total_score,
    COUNT(*) AS patient_count
FROM 
    ocd_patient_data
GROUP BY 
    gender;

-- 4. Differences Based on Marital Status and Education Level
-- Martial Status impact 
SELECT 
    marital_status,
    ROUND(AVG(y_bocs_score_o + y_bocs_score_c),3) AS avg_total_ybocs,
    COUNT(*) AS patient_count
FROM 
    ocd_patient_data
GROUP BY 
    marital_status
ORDER BY 
    avg_total_ybocs DESC;

-- Education Level Impact 
SELECT 
    education_level,
    ROUND(AVG(y_bocs_score_o + y_bocs_score_c),3) AS avg_total_ybocs,
    COUNT(*) AS patient_count
FROM 
    ocd_patient_data
GROUP BY 
    education_level
ORDER BY 
    avg_total_ybocs DESC;

-- 5. Ethnicity and Severity 
SELECT 
    ethnicity,
    ROUND(AVG(y_bocs_score_o),3) AS avg_obsession_score,
    ROUND(AVG(y_bocs_score_c),3) AS avg_compulsion_score,
    ROUND(AVG(y_bocs_score_o + y_bocs_score_c),3) AS avg_total_score,
    COUNT(*) AS patient_count
FROM 
    ocd_patient_data
GROUP BY 
    ethnicity
ORDER BY 
    avg_total_score DESC;


