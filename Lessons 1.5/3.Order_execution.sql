
EXPLAIN ANALYZE
SELECT 
    JPF.company_id,
    cd.name as company_name,
    count(jpf.job_id) as posting_count
FROM job_postings_fact jpf 
    INNER JOIN company_dim cd on jpf.company_id = cd.company_id
GROUP BY 
    jpf.company_id, cd.name
HAVING count(jpf.job_id) > 3000
ORDER BY posting_count desc
LIMIT 10;