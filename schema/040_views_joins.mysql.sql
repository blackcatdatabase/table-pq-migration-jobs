-- Auto-generated from core\joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
-- engine: mysql
-- view:   pq_migration_jobs_metrics

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_pq_migration_jobs_metrics AS
SELECT
  status,
  COUNT(*) AS jobs,
  SUM(processed_count) AS processed_total
FROM pq_migration_jobs
GROUP BY status
ORDER BY status;
