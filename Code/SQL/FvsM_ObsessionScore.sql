-- Count & Pct of F vs M that have OCD & Average Obsession Score by Gender

with data as (
SELECT
"Gender",
count("Patient ID") as patient_count,
round(avg("Y-BOCS Score (Obsessions)"),2) as avg_obs_score

FROM ocd_patient_data
Group By 1
Order by 2
)

select
	sum(case when "Gender" = 'Female' then patient_count else 0 end) as count_female,
	sum(case when "Gender" = 'Male' then patient_count else 0 end) as count_male,

	round(sum(case when "Gender" = 'Female' then patient_count else 0 end)/
	(sum(case when "Gender" = 'Female' then patient_count else 0 end)+sum(case when "Gender" = 'Male' then patient_count else 0 end)) *100,2)
	 as pct_female,

    round(sum(case when "Gender" = 'Male' then patient_count else 0 end)/
	(sum(case when "Gender" = 'Female' then patient_count else 0 end)+sum(case when "Gender" = 'Male' then patient_count else 0 end)) *100,2)
	 as pct_male

from data
;