# SQL Cheatsheet (PostgreSQL)

## Query order
`SELECT → FROM → JOIN → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT`
(Execution order: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT)

## DML
```sql
INSERT INTO t (a, b) VALUES (1, 'x');
UPDATE t SET a = 2 WHERE id = 1;
DELETE FROM t WHERE id = 1;
```

## Joins
| Join | Returns |
|------|---------|
| INNER | Matching rows only |
| LEFT | All left + matching right |
| RIGHT | All right + matching left |
| FULL | All rows from both |
| CROSS | Every combination |

## Aggregates
`COUNT, SUM, AVG, MIN, MAX` with `GROUP BY` and `HAVING`.

## Window functions
`ROW_NUMBER, RANK, DENSE_RANK, NTILE, LAG, LEAD, SUM() OVER (...)`

## psql commands
| Command | Meaning |
|---------|---------|
| `\l` | List databases |
| `\c dbname` | Connect to database |
| `\dt` | List tables |
| `\d table` | Describe table |
| `\df` | List functions |
| `\di` | List indexes |
| `\i file.sql` | Run SQL file |
| `\timing` | Toggle query timing |
| `\q` | Quit |

## PL/pgSQL skeleton
```sql
CREATE OR REPLACE FUNCTION fn(p INT) RETURNS INT
LANGUAGE plpgsql AS $$
DECLARE v INT;
BEGIN
    v := p * 2;
    RETURN v;
END; $$;
```
