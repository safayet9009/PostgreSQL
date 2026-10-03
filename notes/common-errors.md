# Common Errors & Fixes

| Error | Cause | Fix |
|-------|-------|-----|
| `column "x" must appear in the GROUP BY clause or be used in an aggregate function` | Selected a non-aggregated column not in GROUP BY | Add it to GROUP BY or aggregate it |
| `column reference "x" is ambiguous` | Same column name in joined tables | Prefix with table alias (`e.dept_id`) |
| `relation "x" does not exist` | Wrong table name, schema, or not created yet | Check `\dt`; run schema.sql |
| `duplicate key value violates unique constraint` | Inserting an existing key | Use a new value or `ON CONFLICT` |
| `insert or update violates foreign key constraint` | Parent row missing | Insert parent first |
| `null value in column "x" violates not-null constraint` | Missing required value | Provide a value or DEFAULT |
| `cannot drop table because other objects depend on it` | FKs/views depend on it | `DROP TABLE ... CASCADE` (carefully) |
| `syntax error at or near "$$"` | Function body mistake | Check `LANGUAGE`, `BEGIN/END;` and `$$` pairs |
| `function x does not exist` | Argument types differ | Cast arguments or check the signature with `\df` |
| `WHERE` on an aggregate | Aggregates not allowed in WHERE | Use `HAVING` |
| `UPDATE`/`DELETE` changed every row | Forgot WHERE | Test with SELECT first; use `BEGIN ... ROLLBACK` |
