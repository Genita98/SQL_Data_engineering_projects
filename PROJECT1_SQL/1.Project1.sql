/* Identify the top 10 in-demand skills for data engineers
 - Identify the top 10 in-demand skills for data engineers
 - Focus on remote job postings
 - Why? Retrieve the top 10 skills with the highest demand in the remote jobs providing insights into the most valuable skills for data engineers.

 */

--Solution:
SELECT  sd.skills,
        count(jpf.*) as demand_count
FROM 
    job_postings_fact jpf 
INNER JOIN skills_job_dim sjd 
    ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim sd 
    ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title_short ='Data Engineer' 
        AND jpf.job_work_from_home = TRUE 
GROUP BY 
    sd.skills
ORDER BY 
    count(jpf.*) desc
LIMIT 10;

/*

The result
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘

*/