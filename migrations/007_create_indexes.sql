-- indexes
CREATE INDEX idx_invoices_client ON invoices(client_id);
CREATE INDEX idx_recovery_events_client ON recovery_events(client_id);
CREATE INDEX idx_audit_logs_invoice ON audit_logs(invoice_id);
