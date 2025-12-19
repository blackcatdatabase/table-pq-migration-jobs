-- Auto-generated from schema-map-mysql.yaml (map@sha1:0D716345C0228A9FD8972A3D31574000D05317DB)
-- engine: mysql
-- table:  pq_migration_jobs

ALTER TABLE pq_migration_jobs ADD CONSTRAINT fk_pq_mig_policy FOREIGN KEY (target_policy_id) REFERENCES encryption_policies(id) ON DELETE SET NULL;

ALTER TABLE pq_migration_jobs ADD CONSTRAINT fk_pq_mig_algo FOREIGN KEY (target_algo_id) REFERENCES crypto_algorithms(id) ON DELETE SET NULL;

ALTER TABLE pq_migration_jobs ADD CONSTRAINT fk_pq_mig_user FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL;
