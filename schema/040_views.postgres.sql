-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  pq_migration_jobs
-- Contract view for [pq_migration_jobs]
-- Adds helpers: is_done, is_running.
CREATE OR REPLACE VIEW vw_pq_migration_jobs AS
SELECT
  id,
  scope,
  target_policy_id,
  target_algo_id,
  selection,
  scheduled_at,
  started_at,
  finished_at,
  status,
  processed_count,
  error,
  created_by,
  created_at,
  (status = ''done'')    AS is_done,
  (status = ''running'') AS is_running
FROM pq_migration_jobs;

-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  pq_migration_jobs_metrics
-- PQ migration progress by status
CREATE OR REPLACE VIEW vw_pq_migration_jobs_metrics AS
SELECT
  status,
  COUNT(*) AS jobs,
  SUM(processed_count) AS processed_total
FROM pq_migration_jobs
GROUP BY status
ORDER BY status;

