# revenue_rescue_db

PostgreSQL schema for **Revenue Rescue** — a SaaS tool that recovers failed Stripe payments via automated email retries.

## Structure

```
schema.sql          ← full schema in one file (apply directly to a fresh DB)
migrations/
  001_create_clients.sql          ← clients (SaaS tenants)
  002_create_templates.sql        ← email templates per client
  003_create_invoices.sql         ← invoices synced from Stripe
  004_create_recovery_events.sql  ← recovery attempt analytics
  005_create_audit_logs.sql       ← debugging & event timeline
  006_create_webhook_events.sql   ← webhook idempotency log
  007_create_indexes.sql          ← performance indexes
```

## Quick start

Apply the full schema to a local PostgreSQL database:

```bash
psql -d your_database -f schema.sql
```

Or run migrations in order:

```bash
for f in migrations/*.sql; do psql -d your_database -f "$f"; done
```