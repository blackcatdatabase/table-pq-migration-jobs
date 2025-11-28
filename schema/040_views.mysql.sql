-- Auto-generated from schema-views-mysql.psd1 (map@mtime:2025-11-27T15:35:35Z)
-- engine: mysql
-- table:  pq_migration_jobs

-- Contract view for [pq_migration_jobs]
-- Adds helpers: is_done, is_running.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_pq_migration_jobs AS
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
  (status = 'done')    AS is_done,
  (status = 'running') AS is_running
FROM pq_migration_jobs;
