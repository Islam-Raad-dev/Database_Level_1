-- 3NF (Third Normal Form)
-- 1. 1NF & 2NF: The table must already be in the First Normal Form (1NF) & Second Normal Form (2NF).

-- 2. No transitive dependency: All non-prime attributes must not be transitively dependent on the primary key.
--    * In other words, a non-key column cannot depend on another non-key column.
--    * All non-key columns must depend ONLY on the primary key.
