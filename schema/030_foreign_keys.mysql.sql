-- Auto-generated from schema-map-mysql.yaml (map@sha1:7AAC4013A2623AC60C658C9BF8458EFE0C7AB741)
-- engine: mysql
-- table:  pq_migration_jobs

ALTER TABLE pq_migration_jobs ADD CONSTRAINT fk_pq_mig_policy FOREIGN KEY (target_policy_id) REFERENCES encryption_policies(id) ON DELETE SET NULL;

ALTER TABLE pq_migration_jobs ADD CONSTRAINT fk_pq_mig_algo FOREIGN KEY (target_algo_id) REFERENCES crypto_algorithms(id) ON DELETE SET NULL;

ALTER TABLE pq_migration_jobs ADD CONSTRAINT fk_pq_mig_user FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL;
