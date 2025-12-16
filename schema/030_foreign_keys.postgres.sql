-- Auto-generated from schema-map-postgres.yaml (map@sha1:FAEA49A5D5F8FAAD9F850D0F430ED451C5C1D707)
-- engine: postgres
-- table:  pq_migration_jobs

ALTER TABLE pq_migration_jobs ADD CONSTRAINT fk_pq_mig_policy FOREIGN KEY (target_policy_id) REFERENCES encryption_policies(id) ON DELETE SET NULL;

ALTER TABLE pq_migration_jobs ADD CONSTRAINT fk_pq_mig_algo   FOREIGN KEY (target_algo_id)   REFERENCES crypto_algorithms(id) ON DELETE SET NULL;

ALTER TABLE pq_migration_jobs ADD CONSTRAINT fk_pq_mig_user   FOREIGN KEY (created_by)       REFERENCES users(id) ON DELETE SET NULL;
