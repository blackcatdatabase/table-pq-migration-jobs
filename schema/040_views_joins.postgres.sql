-- Auto-generated from joins-postgres.yaml (map@85230ed)
-- engine: postgres
-- view:   pq_migration_jobs_metrics

-- PQ migration progress by status
CREATE OR REPLACE VIEW vw_pq_migration_jobs_metrics AS
SELECT
  status,
  COUNT(*) AS jobs,
  SUM(processed_count) AS processed_total
FROM pq_migration_jobs
GROUP BY status
ORDER BY status;
