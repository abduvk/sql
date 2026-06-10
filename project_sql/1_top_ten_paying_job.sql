select 
jb.job_id,
jb.job_title_short,
cd.name as company,
jb.salary_year_avg

from 
job_postings_fact as jb
left join company_dim as cd on jb.company_id=cd.company_id 
where salary_year_avg is not null
and jb.job_title_short = 'Data Analyst'
and job_location = 'Anywhere'
order by jb.salary_year_avg desc
limit 10
--query 1