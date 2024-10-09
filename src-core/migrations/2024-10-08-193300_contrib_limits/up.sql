CREATE TABLE contribution_limits (
    id TEXT PRIMARY KEY NOT NULL,
    group_name TEXT NOT NULL,
    contribution_year INTEGER NOT NULL,
    limit_amount NUMERIC NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Add contribution_limit_ids column to accounts table
ALTER TABLE accounts ADD COLUMN contribution_limit_ids TEXT;

-- Add instance_id to app_settings
INSERT INTO app_settings (setting_key, setting_value) VALUES ('instance_id', (SELECT hex(randomblob(16))));
