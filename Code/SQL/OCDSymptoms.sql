Select 
	family_history_of_ocd,
	SUM
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