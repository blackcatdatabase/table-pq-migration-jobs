-- Auto-generated from schema-map-postgres.yaml (map@sha1:F0EE237771FBA8DD7C4E886FF276F91A862C3718)
-- engine: postgres
-- table:  pq_migration_jobs

CREATE INDEX IF NOT EXISTS idx_pq_mig_status_sched ON pq_migration_jobs (status, scheduled_at);
