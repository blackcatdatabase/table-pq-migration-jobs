<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – pq_migration_jobs

Jobs that migrate stored data to PQ-safe hashing/encryption policies.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| scope | TEXT | NO | — | What is being migrated (hashes, wrappers, signatures). |  |
| started_at | TIMESTAMPTZ(6) | YES | — | When the job started. |  |
| finished_at | TIMESTAMPTZ(6) | YES | — | Completion timestamp. |  |
| status | TEXT | NO | 'pending' | Execution status. | enum: pending, running, done, failed, cancelled |
| error | TEXT | YES | — | Failure cause, if any. |  |
| created_by | BIGINT | YES | — | User who enqueued the job. |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |