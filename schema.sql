-- ============================================================
-- revenue_rescue_db — full schema
-- Run migrations in order, or apply this file directly.
-- ============================================================

-- CLIENTS (who uses your SaaS)
CREATE TABLE clients (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT,
  stripe_account_id TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- EMAIL TEMPLATES
CREATE TABLE templates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  client_id UUID REFERENCES clients(id),
  subject TEXT,
  body TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- INVOICES (from Stripe)
CREATE TABLE invoices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  stripe_invoice_id TEXT UNIQUE,
  client_id UUID REFERENCES clients(id),

  customer_email TEXT,
  amount_due INTEGER,

  status TEXT, -- pending / paid / failed
  attempt_count INTEGER DEFAULT 0,

  created_at TIMESTAMP DEFAULT NOW()
);

-- RECOVERY EVENTS (analytics core)
CREATE TABLE recovery_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  invoice_id UUID REFERENCES invoices(id),
  stripe_invoice_id TEXT,
  client_id UUID REFERENCES clients(id),

  attempt_number INTEGER,
  probability FLOAT,

  status TEXT, -- success / failed
  amount INTEGER,

  created_at TIMESTAMP DEFAULT NOW()
);

-- AUDIT LOGS (debugging + timeline)
CREATE TABLE audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  client_id UUID REFERENCES clients(id),
  invoice_id UUID REFERENCES invoices(id),

  event_type TEXT,
  data JSONB,

  created_at TIMESTAMP DEFAULT NOW()
);

-- WEBHOOK EVENTS (idempotency)
CREATE TABLE webhook_events (
  id TEXT PRIMARY KEY,
  created_at TIMESTAMP DEFAULT NOW()
);

-- indexes
CREATE INDEX idx_invoices_client ON invoices(client_id);
CREATE INDEX idx_recovery_events_client ON recovery_events(client_id);
CREATE INDEX idx_audit_logs_invoice ON audit_logs(invoice_id);
