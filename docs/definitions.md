# pq_migration_jobs

Jobs that migrate stored data to PQ-safe hashing/encryption policies.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| created_by | BIGINT | YES |  | User who enqueued the job. |
| error | TEXT | YES |  | Failure cause, if any. |
| finished_at | DATETIME(6) | YES |  | Completion timestamp. |
| id | BIGINT | NO |  | Surrogate primary key. |
| processed_count | BIGINT | NO | 0 | How many records were processed. |
| scope | mysql: ENUM('hashes','wrappers','signatures') / postgres: TEXT | NO |  | What is being migrated (hashes, wrappers, signatures). |
| selection | mysql: JSON / postgres: JSONB | YES |  | JSON selector describing the affected dataset. |
| scheduled_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | YES |  | Scheduled start time. |
| started_at | DATETIME(6) | YES |  | When the job started. |
| status | mysql: ENUM('pending','running','done','failed','cancelled') / postgres: TEXT | NO | pending | Execution status. (enum: pending, running, done, failed, cancelled) |
| target_algo_id | BIGINT | YES |  | Target crypto algorithm id, optional. |
| target_policy_id | BIGINT | YES |  | Target encryption policy id, optional. |

## Engine Details

### mysql

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_pq_mig_status_sched | status,scheduled_at | INDEX idx_pq_mig_status_sched (status, scheduled_at) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_pq_mig_algo | target_algo_id | crypto_algorithms(id) | ON DELETE SET |
| fk_pq_mig_policy | target_policy_id | encryption_policies(id) | ON DELETE SET |
| fk_pq_mig_user | created_by | users(id) | ON DELETE SET |

### postgres

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_pq_mig_status_sched | status,scheduled_at | CREATE INDEX IF NOT EXISTS idx_pq_mig_status_sched ON pq_migration_jobs (status, scheduled_at) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_pq_mig_algo | target_algo_id | crypto_algorithms(id) | ON DELETE SET |
| fk_pq_mig_policy | target_policy_id | encryption_policies(id) | ON DELETE SET |
| fk_pq_mig_user | created_by | users(id) | ON DELETE SET |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_pq_migration_jobs | mysql | algorithm=MERGE, security=INVOKER | [schema\040_views.mysql.sql](schema\040_views.mysql.sql) |
| vw_pq_migration_jobs_metrics | mysql | algorithm=TEMPTABLE, security=INVOKER | [schema\040_views_joins.mysql.sql](schema\040_views_joins.mysql.sql) |
| vw_pq_migration_jobs | postgres |  | [schema\040_views.postgres.sql](schema\040_views.postgres.sql) |
| vw_pq_migration_jobs_metrics | postgres |  | [schema\040_views_joins.postgres.sql](schema\040_views_joins.postgres.sql) |
