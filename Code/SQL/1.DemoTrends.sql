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