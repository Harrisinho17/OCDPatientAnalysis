Select 
	family_history_of_ocd,
	COUNT(*) AS patient_count,
	obsession_type,
    AVG(y_bocs_score_o) AS avg_ybocs_score_o,
	compulsion_type,
	AVG(y_bocs_score_c) AS avg_ybocs_score_c
FROM 
	ocd_patient_data
Group By 
	obsession_type,
	compulsion_type,
	family_history_of_ocd
Order By 
3,5,1


SELECT * FROM public.ocd_patient_data

-- 1. Obsession & Compulsion Types
-- Obsessions
SELECT obsession_type, COUNT(*) AS obsession_count
FROM ocd_patient_data
GROUP BY obsession_type
ORDER BY obsession_count DESC;

-- Compulsions
SELECT compulsion_type, COUNT(*) AS compulsion_count
FROM ocd_patient_data
GROUP BY compulsion_type
ORDER BY compulsion_count DESC;

-- 2. Correlation between obsession type and Y-BOCS score. 

SELECT obsession_type, 
       ROUND(AVG(y_bocs_score_o),3) AS avg_obsession_ybocs
FROM ocd_patient_data
GROUP BY obsession_type
ORDER BY avg_obsession_ybocs DESC;

-- 3. Comparing severity of compulsions vs obsessions
	
SELECT ROUND(AVG(y_bocs_score_o),3) AS avg_obsession_score,
       ROUND(AVG(y_bocs_score_c),3) AS avg_compulsion_score,
       ROUND(AVG(y_bocs_score_c) - AVG(y_bocs_score_o),3) AS difference
FROM ocd_patient_data;

-- 4. Impact of family history on symptom severity

SELECT family_history_of_ocd,
       ROUND(AVG(y_bocs_score_o + y_bocs_score_c),3) AS avg_total_ybocs,
       COUNT(*) AS patient_count
FROM ocd_patient_data
GROUP BY family_history_of_ocd;