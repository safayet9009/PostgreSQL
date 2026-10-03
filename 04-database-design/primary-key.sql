-- Purpose: Primary keys uniquely identify each row (UNIQUE + NOT NULL)
-- Standalone: creates its own practice tables

DROP TABLE IF EXISTS pk_demo, pk_composite_demo;

-- Surrogate key with auto-increment
CREATE TABLE pk_demo (
    id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL
);

-- Composite primary key
CREATE TABLE pk_composite_demo (
    student_id INT,
    course_id  INT,
    enrolled_on DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO pk_demo (name) VALUES ('A'), ('B');
SELECT * FROM pk_demo;
