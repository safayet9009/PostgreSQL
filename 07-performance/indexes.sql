-- Purpose: Indexes speed up reads at the cost of slower writes and extra storage
-- Standalone: builds a 200,000-row practice table

DROP TABLE IF EXISTS perf_demo;

CREATE TABLE perf_demo AS
SELECT g AS id,
       'user_' || g AS username,
       (random() * 100)::INT AS dept_id,
       (random() * 100000)::INT AS salary
FROM generate_series(1, 200000) g;

-- B-Tree index (default)
CREATE INDEX idx_perf_username ON perf_demo (username);

-- Composite index (column order matters!)
CREATE INDEX idx_perf_dept_salary ON perf_demo (dept_id, salary);

-- Unique index
CREATE UNIQUE INDEX idx_perf_id ON perf_demo (id);

-- Partial index
CREATE INDEX idx_perf_high_salary ON perf_demo (salary) WHERE salary > 90000;

-- List indexes
SELECT indexname, indexdef FROM pg_indexes WHERE tablename = 'perf_demo';

-- Drop
-- DROP INDEX idx_perf_username;
