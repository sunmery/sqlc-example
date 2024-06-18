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
