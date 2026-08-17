/*
    Question: What are the highest-paying skills for data engineers?
        - Calculate the median salary for each skill required in data engineer positions
        - Focus on remote positions with specified salaries
        - Include skill frequency to indetify both salary and demand
        -Why? Helps identify which skills command thwe highest compensation while also showing
            how commos those skills are, providing a more complete picture for skill development priorities
*/




SELECT  sd.skills,
        round(MEDIAN(jpf.salary_year_avg),0) as median_salary,
        count(jpf.*) as demand_count,
FROM 
    job_postings_fact jpf 
INNER JOIN skills_job_dim sjd 
    ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim sd 
    ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title_short ='Data Engineer' 
        AND jpf.job_work_from_home = TRUE and jpf.salary_year_avg is not null
GROUP BY 
    sd.skills
HAVING count(jpf.*) > 100
ORDER BY 
    median(jpf.salary_year_avg) desc
LIMIT 25;



/*
Result:
┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ terraform  │      184000.0 │          193 │
│ kubernetes │      150500.0 │          147 │
│ airflow    │      150000.0 │          386 │
│ kafka      │      145000.0 │          292 │
│ pyspark    │      140000.0 │          152 │
│ git        │      140000.0 │          208 │
│ go         │      140000.0 │          113 │
│ spark      │      140000.0 │          503 │
│ aws        │      137320.0 │          783 │
│ scala      │      137290.0 │          247 │
│ gcp        │      136000.0 │          196 │
│ mongodb    │      135750.0 │          136 │
│ snowflake  │      135500.0 │          438 │
│ bigquery   │      135000.0 │          123 │
│ java       │      135000.0 │          303 │
│ github     │      135000.0 │          127 │
│ hadoop     │      135000.0 │          198 │
│ docker     │      135000.0 │          144 │
│ python     │      135000.0 │         1133 │
│ r          │      134775.0 │          133 │
│ nosql      │      134415.0 │          193 │
│ databricks │      132750.0 │          266 │
│ mysql      │      130500.0 │          101 │
│ sql        │      130000.0 │         1128 │
│ redshift   │      130000.0 │          274 │
└────────────┴───────────────┴──────────────┘

*/