-- Purpose: Foreign keys enforce relationships between tables
-- Standalone: creates its own practice tables

DROP TABLE IF EXISTS fk_child, fk_parent CASCADE;

CREATE TABLE fk_parent (
    id   INT PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE fk_child (
    id        INT PRIMARY KEY,
    parent_id INT NOT NULL,
    CONSTRAINT fk_child_parent
        FOREIGN KEY (parent_id) REFERENCES fk_parent(id)
        ON DELETE CASCADE      -- delete children when parent is deleted
        ON UPDATE CASCADE
);

INSERT INTO fk_parent VALUES (1, 'Parent 1');
INSERT INTO fk_child  VALUES (1, 1);

-- This fails: parent 99 does not exist
-- INSERT INTO fk_child VALUES (2, 99);

-- ON DELETE options: CASCADE | SET NULL | SET DEFAULT | RESTRICT | NO ACTION
