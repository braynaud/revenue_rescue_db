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
