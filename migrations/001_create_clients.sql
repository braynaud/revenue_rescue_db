-- CLIENTS (who uses your SaaS)
CREATE TABLE clients (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT,
  stripe_account_id TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);
