with top_jobs as (
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
)
select 
top_jobs.*,
skills_dim.skills
from top_jobs
inner join skills_job_dim on top_jobs.job_id = skills_job_dim.job_id
inner join skills_dim on skills_dim.skill_id=skills_job_dim.skill_id

   -- query 2
    -- gives me the best paying jobs and skills that i need to master for it 