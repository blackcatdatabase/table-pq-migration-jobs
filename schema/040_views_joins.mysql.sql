-- Auto-generated from joins-mysql.yaml (map@85230ed)
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
