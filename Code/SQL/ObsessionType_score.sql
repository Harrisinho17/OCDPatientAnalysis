SELECT 
	"Obsession Type",
	"Gender",
	COUNT(*) AS instances,
	round(avg("Y-BOCS Score (Obsessions)"),2) as obs_score
FROM ocd_patient_data
GROUP BY 
	1,2
Order By 
	1,4 Desc
