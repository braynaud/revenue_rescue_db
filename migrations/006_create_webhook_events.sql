-- WEBHOOK EVENTS (idempotency)
CREATE TABLE webhook_events (
  id TEXT PRIMARY KEY,
  created_at TIMESTAMP DEFAULT NOW()
);
