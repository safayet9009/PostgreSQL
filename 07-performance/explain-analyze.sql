-- Purpose: Compare execution plans with and without an index
-- Run 07-performance/indexes.sql first (or this file recreates the table)

DROP TABLE IF EXISTS perf_demo2;
CREATE TABLE perf_demo2 AS
SELECT g AS id, 'user_' || g AS username
FROM generate_series(1, 200000) g;

-- 1) WITHOUT index -> expect "Seq Scan"
EXPLAIN ANALYZE
SELECT * FROM perf_demo2 WHERE username = 'user_150000';

-- 2) Create index
CREATE INDEX idx_perf2_username ON perf_demo2 (username);
ANALYZE perf_demo2;

-- 3) WITH index -> expect "Index Scan" / "Bitmap Index Scan"
EXPLAIN ANALYZE
SELECT * FROM perf_demo2 WHERE username = 'user_150000';

-- Useful options
EXPLAIN (ANALYZE, BUFFERS, VERBOSE)
SELECT * FROM perf_demo2 WHERE username = 'user_150000';

-- Note: EXPLAIN ANALYZE actually runs the query.
-- Wrap INSERT/UPDATE/DELETE in BEGIN ... ROLLBACK when testing.
