CREATE DATABASE bank;

CREATE TABLE accounts
(
    id         bigserial primary key,
    owner      varchar not null,
    balance    bigint  not null,
    currency   varchar,
    created_at timestamptz
);

CREATE TABLE entries
(
    id         bigserial primary key,
    account_id bigint REFERENCES accounts (id),
    amount     bigint,
    created_at timestamptz
);

CREATE TABLE transfers
(
    id              bigserial primary key,
    from_account_id bigint REFERENCES accounts (id),
    to_account_id   bigint REFERENCES accounts (id),
    created_at      timestamptz
);

CREATE INDEX idx_account_id ON accounts (id);
CREATE INDEX idx_account_id ON entries (account_id);
CREATE INDEX idx_from_account_id ON transfers (from_account_id);
CREATE INDEX idx_to_account_id ON transfers (to_account_id);
CREATE INDEX idx_from_to_account_id ON transfers (from_account_id, to_account_id);
