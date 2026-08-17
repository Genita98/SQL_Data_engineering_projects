--LEFT JOIN:
SELECT 
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name as COMPANY_NAME,
    jpf.job_location,
FROM 
        job_postings_fact AS jpf
    LEFT JOIN company_dim AS cd
        ON jpf.company_id = cd.company_id
LIMIT 10;    


--count:
--1615930
SELECT COUNT(*) FROM job_postings_fact; --1615930 same




--RIGHT JOIN:


SELECT 
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name as COMPANY_NAME,
    jpf.job_location,
FROM 
        job_postings_fact AS jpf
    RIGHT JOIN company_dim AS cd
        ON jpf.company_id = cd.company_id;
LIMIT 10;    




--INNER JOIN:

SELECT 
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name as COMPANY_NAME,
    jpf.job_location,
FROM 
        job_postings_fact AS jpf
    INNER JOIN company_dim AS cd
        ON jpf.company_id = cd.company_id
LIMIT 10;    

--FULL OUTER JOIN



--EXAMPLE 2.


SELECT 
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM job_postings_fact jpf
LEFT JOIN skills_job_dim sjd
    on jpf.job_id = sjd.job_id
LEFT JOIN skills_dim sd 
ON sd.skill_id = sjd.skill_id;

LIMIT 10


SELECT 
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd
    on jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd 
ON sd.skill_id = sjd.skill_id;


SELECT 
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM job_postings_fact jpf
FULL JOIN skills_job_dim sjd
    on jpf.job_id = sjd.job_id
FULL JOIN skills_dim sd 
ON sd.skill_id = sjd.skill_id;
