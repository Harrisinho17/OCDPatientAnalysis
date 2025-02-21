-- Count of Patients by Ethnicity and their respective average obsession score

select
	"Ethnicity",
	count("Patient ID") as patient_count,
	avg("Y-BOCS Score (Obsessions)") as obs_score
From ocd_patient_data
Group by 1
Order by 2;