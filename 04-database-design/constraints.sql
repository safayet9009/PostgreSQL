-- Purpose: NOT NULL, UNIQUE, CHECK, DEFAULT
-- Standalone: creates its own practice table

DROP TABLE IF EXISTS constraint_demo;

CREATE TABLE constraint_demo (
    id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email      TEXT        NOT NULL UNIQUE,
    age        INT         CHECK (age >= 18),
    salary     NUMERIC(10,2) CHECK (salary > 0),
    status     TEXT        DEFAULT 'active' CHECK (status IN ('active','inactive')),
    created_at TIMESTAMP   DEFAULT NOW()
);

INSERT INTO constraint_demo (email, age, salary) VALUES ('a@example.com', 25, 1000);

-- Each of these fails:
-- INSERT INTO constraint_demo (email, age, salary) VALUES ('a@example.com', 30, 500); -- UNIQUE
-- INSERT INTO constraint_demo (email, age, salary) VALUES ('b@example.com', 15, 500); -- CHECK age
-- INSERT INTO constraint_demo (email, age, salary) VALUES (NULL, 30, 500);            -- NOT NULL

-- Add / drop constraints on existing tables
ALTER TABLE constraint_demo ADD CONSTRAINT chk_age_max CHECK (age <= 65);
ALTER TABLE constraint_demo DROP CONSTRAINT chk_age_max;
