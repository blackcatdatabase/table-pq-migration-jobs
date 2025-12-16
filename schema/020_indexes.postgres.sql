-- Auto-generated from schema-map-postgres.yaml (map@sha1:FAEA49A5D5F8FAAD9F850D0F430ED451C5C1D707)
-- engine: postgres
-- table:  pq_migration_jobs

CREATE INDEX IF NOT EXISTS idx_pq_mig_status_sched ON pq_migration_jobs (status, scheduled_at);
