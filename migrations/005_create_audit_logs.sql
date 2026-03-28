-- AUDIT LOGS (debugging + timeline)
CREATE TABLE audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  client_id UUID REFERENCES clients(id),
  invoice_id UUID REFERENCES invoices(id),

  event_type TEXT,
  data JSONB,

  created_at TIMESTAMP DEFAULT NOW()
);
