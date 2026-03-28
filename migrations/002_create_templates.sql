-- EMAIL TEMPLATES
CREATE TABLE templates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  client_id UUID REFERENCES clients(id),
  subject TEXT,
  body TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);
