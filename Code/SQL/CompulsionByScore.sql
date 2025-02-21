-- What is the most common Obsesison type & its's respective Average Obsession Score

Select
"Compulsion Type",
count("Patient ID") as patient_count,
round(avg("Y-BOCS Score (Obsessions)"),2) as obs_score
from ocd_patient_data
group by 1
Order by 2;

