-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  pq_migration_jobs

CREATE TABLE IF NOT EXISTS pq_migration_jobs (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  scope ENUM('hashes','wrappers','signatures') NOT NULL,
  target_policy_id BIGINT UNSIGNED NULL,
  target_algo_id BIGINT UNSIGNED NULL,
  selection JSON NULL,
  scheduled_at DATETIME(6) NULL,
  started_at DATETIME(6) NULL,
  finished_at DATETIME(6) NULL,
  status ENUM('pending','running','done','failed','cancelled') NOT NULL DEFAULT 'pending',
  processed_count BIGINT UNSIGNED NOT NULL DEFAULT 0,
  error TEXT NULL,
  created_by BIGINT UNSIGNED NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  INDEX idx_pq_mig_status_sched (status, scheduled_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
