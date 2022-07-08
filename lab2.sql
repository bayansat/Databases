/* 1 Explain the difference between DDL and DML, give the following examples:
 a. at least 3 DDL commands;
 b. at least 4 DML commands.
 The difference between DDL and DML is that DDL is used to define the schema or
 the structure of database which means it is used to create the table(relation)
 and the DML is used to access, or modify the schema or table created by DDL
 a. DDL commands:CREATE,ALTER,REVOKE
 b. DML commands:SELECT,INSERT,UPDATE,DELETE
    */


/* 2 Write SQL statements to create tables in the figure */

CREATE TABLE order_items(
    order_code integer NOT NULL UNIQUE REFERENCES orders (code),
    product_id varchar NOT NULL UNIQUE REFERENCES products (id),
    quantity   integer NOT NULL CHECK (quantity>0),
    PRIMARY KEY (order_code,product_id)
);

CREATE TABLE products(
    id          varchar PRIMARY KEY,
    name        varchar NOT NULL UNIQUE,
    description text,
    price       double precision NOT NULL CHECK (price>0)
);

CREATE TABLE orders(
    code        integer PRIMARY KEY,
    customer_id integer REFERENCES customers (id),
    total_sum   double precision NOT NULL CHECK (total_sum>0),
    is_paid     boolean NOT NULL
);

CREATE TABLE customers(
    id               integer PRIMARY KEY,
    full_name        varchar(50) NOT NULL,
    timestamp        timestamp NOT NULL,
    delivery_address text NOT NULL
);



/* 3 */
CREATE TABLE lesson_participants(
    lesson_id integer PRIMARY KEY,
    lesson_title varchar(50) NOT NULL,
    teaching_instructor_id integer NOT NULL REFERENCES instructors (instructor_id),
    studying_students integer NOT NULL REFERENCES class (class_id),
    room_number integer NOT NULL CHECK (room_number > 0)
);


CREATE TABLE instructors(
    instructor_id integer PRIMARY KEY REFERENCES instr_languages(language_instructor),
    full_name varchar(50) NOT NULL CHECK,
    languages  integer NOT NULL REFERENCES instr_languages(language_instructor),
    work_experience varchar(20) NOT NULL,
    remote_lessons boolean NOT NULL
);

CREATE TABLE students(
    student_id integer PRIMARY KEY REFERENCES class (student_id),
    full_name varchar(50) NOT NULL CHECK,
    age integer NOT NULL CHECK,
    birth_date date NOT NULL,
    gender varchar(20) NOT NULL,
    average_grade double precision NOT NULL CHECK,
    info_about_yourself text NOT NULL,
    dormitory boolean NOT NULL,
    additional_info text
);

CREATE TABLE class(
    class_id integer NOT NULL,
    student_id integer NOT NULL,
    PRIMARY KEY (class_id, student_id)
);

CREATE TABLE instr_languages(
    language_instructor integer NOT NULL,
    language_name varchar(20) NOT NULL,
    PRIMARY KEY (language_instructor, language_name)
);

/* 4 */
INSERT INTO students VALUES (12345,'Bayan Satzh', 21, 1998-01-21, 'Female', 90.1, '2nd year student', False, 'left blank');

UPDATE students
SET gender='Male' WHERE student_id=12345;

DELETE FROM students
WHERE student_id=12345;

