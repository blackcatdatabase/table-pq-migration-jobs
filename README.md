# 📦 Pq Migration Jobs

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->

> Schema package for table **pq_migration_jobs** (repo: `pq-migration-jobs`).

## Files
```
schema/
  001_table.sql
  020_indexes.sql
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/020_indexes.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/020_indexes.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/020_indexes.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT | — | AS | PK |
| scope | TEXT | NO | — |  |
| target_policy_id | BIGINT | YES | — |  |
| target_algo_id | BIGINT | YES | — |  |
| selection | JSONB | YES | — |  |
| scheduled_at | TIMESTAMPTZ(6) | YES | — |  |
| started_at | TIMESTAMPTZ(6) | YES | — |  |
| finished_at | TIMESTAMPTZ(6) | YES | — |  |
| status | TEXT | NO | 'pending' |  |
| processed_count | BIGINT | NO | 0 |  |
| error | TEXT | YES | — |  |
| created_by | BIGINT | YES | — |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) |  |

## Relationships
- FK → **crypto_algorithms** via (target_algo_id) (ON DELETE SET NULL).
- FK → **encryption_policies** via (target_policy_id) (ON DELETE SET NULL).
- FK → **users** via (created_by) (ON DELETE SET NULL).

```mermaid
erDiagram
  PQ_MIGRATION_JOBS {
    INT id PK
    VARCHAR scope
    INT target_policy_id
    INT target_algo_id
    JSONB selection
    TIMESTAMPTZ scheduled_at
    TIMESTAMPTZ started_at
    TIMESTAMPTZ finished_at
    VARCHAR status
    INT processed_count
    VARCHAR error
    INT created_by
    TIMESTAMPTZ created_at
  }
  PQ_MIGRATION_JOBS }o--|| CRYPTO_ALGORITHMS : "target_algo_id"
  PQ_MIGRATION_JOBS }o--|| ENCRYPTION_POLICIES : "target_policy_id"
  PQ_MIGRATION_JOBS }o--|| USERS : "created_by"
```

## Indexes
- 1 deferred index statement(s) in schema/020_indexes.sql.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.
