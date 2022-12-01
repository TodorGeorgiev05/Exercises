CREATE TABLE majors(
major_id int(11) PRIMARY KEY,
name varchar(50)
);

CREATE TABLE students(
student_id int(11) auto_increment PRIMARY KEY,
student_number varchar(12),
studen_name varchar(50),
major_id int(11),
constraint FK_students_majors
foreign key (major_id)
references majors (major_id)
);


CREATE TABLE payments(
payment_id int(11),
payment_date DATE,
payment_amount DECIMAL(8,2),
student_id int(11),
constraint FK_students_payments
foreign key (student_id)
references students(student_id)
);

CREATE TABLE subjects(
subject_id int(11)PRIMARY KEY,
subject_name varchar(50)
);

CREATE TABLE adenga(
student_id int(11),
subject_id int(11),
constraint FK_agenda_subject
foreign key (subject_id)
references subjects(subject_id),
constraint FK_agenda_students
foreign key (student_id)
references students(student_id)
);

DROP TABLE `minions`.`adenga`, minions.subjects, minions.payments, minions.students, minions.majors;