# Query Optimization Notes

## Reading EXPLAIN output
| Node | Meaning |
|------|---------|
| Seq Scan | Reads the whole table |
| Index Scan | Uses an index to find rows |
| Bitmap Index Scan | Index finds many rows, then fetches pages in bulk |
| Nested Loop / Hash Join / Merge Join | Join strategies |
| cost=a..b | Planner's estimated startup..total cost |
| actual time | Real time (only with ANALYZE) |

## Checklist
1. Select only needed columns (avoid `SELECT *`).
2. Index columns used in `WHERE`, `JOIN`, and `ORDER BY`.
3. Do not wrap indexed columns in functions: `WHERE LOWER(email) = ...` skips a normal index (use an expression index).
4. Use `LIMIT` when you only need a few rows.
5. Prefer `EXISTS` over `IN` for large subqueries.
6. Run `ANALYZE` after bulk loads so the planner has fresh statistics.
7. Do not over-index: each index slows INSERT/UPDATE/DELETE.

## Before / After example
Record your own results here:

| Query | Without index | With index |
|-------|---------------|------------|
| `WHERE username = 'user_150000'` | _ms_ | _ms_ |
