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
