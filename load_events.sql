DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'load_event_type') THEN
    CREATE TYPE IF NOT EXISTS load_event_type AS ENUM ('update_invoice_memo', 'update_invoice_amount');
END IF;
END
$$;
CREATE TABLE IF NOT EXISTS load_events (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    load_id TEXT NOT NULL REFERENCES loads(id),
    created_by TEXT NOT NULL,
    created_on TIMESTAMP NOT NULL default(now()),
    event_type load_event_type NOT NULL,
    value TEXT NOT NULL
);