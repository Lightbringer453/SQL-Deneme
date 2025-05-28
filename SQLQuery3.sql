CREATE TABLE department (
    dept_name VARCHAR(100) PRIMARY KEY,
    building VARCHAR(100),
    budget DECIMAL(10, 2)
);

CREATE TABLE instructor (
    ID INT PRIMARY KEY,
    name VARCHAR(100),
    dept_name VARCHAR(100),
    salary DECIMAL(10, 2),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE student (
    ID INT PRIMARY KEY,
    name VARCHAR(100),
    dept_name VARCHAR(100),
    tot_cred INT,
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE advisor (
    s_ID INT,
    i_ID INT,
    PRIMARY KEY (s_ID, i_ID),
    FOREIGN KEY (s_ID) REFERENCES student(ID),
    FOREIGN KEY (i_ID) REFERENCES instructor(ID)
);

CREATE TABLE course (
    course_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100),
    dept_name VARCHAR(100),
    credits INT,
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE teaches (
    ID INT,
    course_id VARCHAR(10),
    sec_id INT,
    semester VARCHAR(10),
    year INT,
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES instructor(ID),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE takes (
    ID INT,
    course_id VARCHAR(10),
    sec_id INT,
    semester VARCHAR(10),
    year INT,
    grade CHAR(2),
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES student(ID),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES teaches(course_id, sec_id, semester, year)
);

CREATE TABLE classroom (
    building VARCHAR(100),
    room_number VARCHAR(10),
    capacity INT,
    PRIMARY KEY (building, room_number)
);

CREATE TABLE time_slot (
    time_slot_id INT PRIMARY KEY,
    day VARCHAR(10),
    start_time TIME,
    end_time TIME
);

CREATE TABLE section (
    course_id VARCHAR(10),
    sec_id INT,
    semester VARCHAR(10),
    year INT,
    building VARCHAR(100),
    room_number VARCHAR(10),
    time_slot_id INT,
    PRIMARY KEY (course_id, sec_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (building, room_number) REFERENCES classroom(building, room_number),
    FOREIGN KEY (time_slot_id) REFERENCES time_slot(time_slot_id)
);

CREATE TABLE prereq (
    course_id VARCHAR(10),
    prereq_id VARCHAR(10),
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (prereq_id) REFERENCES course(course_id)
);
