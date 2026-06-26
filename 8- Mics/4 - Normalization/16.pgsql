-- What is Normalization?

-- 1. Normalization is the process of organizing data in a database to reduce redundancy and improve data consistency.

-- 2. In other words, it is the process of breaking down a larger database into smaller, more manageable pieces,
      * while ensuring that the data is logically organized and free from redundant information.

-- 3. Normalization is achieved by applying a set of rules, called Normal Forms, to the database tables.
      * The higher the normal form, the more strictly the rules are applied, and the more normalized the database is.

-- 4. The goal of normalization is to eliminate data anomalies, such as duplicate or inconsistent data,
      * which can lead to errors and inconsistencies in the database.

-- 5. A normalized database is easier to maintain, update, and modify, and can be queried more efficiently.

-------------------------------------------------------------------------------------------------------------------

-- 1NF (First Normal Form)

-- 1. A primary key: A unique identifier for each record in the table.

-- 2. Atomic values: Each column should contain only a single value, and each value should be indivisible.
--    * Note: Here, atomicity states that a single cell cannot hold multiple values.
        It must hold only a single-valued attribute.
--    * The First normal form disallows the multi-valued attribute, composite attribute, and their combinations.

-- 3. No repeating groups: Each column should have a distinct name, and there should be no repeating groups of columns.

-------------------------------------------------------------------------------------------------------------------

-- 2NF (Second Normal Form)
-- 1. 1NF: The table must already be in the First Normal Form (1NF).

-- 2. No partial dependency: All non-prime attributes must be fully functionally dependent on the entire primary key.
--    * In other words, a non-key column cannot depend on only a part of a composite primary key. It must depend on the whole key.
--    * This rule only applies when the primary key is a composite key (made up of multiple columns).
