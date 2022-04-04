/* Instead of inserting name of School many times,
   we will just write id in main table saving space
   */
create table if not exists School
(
    schoolId int not null primary key,
    schoolName text
);
/* Motivation as School table */
create table if not exists Teacher
(
    teacherId int not null primary key,
    teacherName text
);
/* Motivation as School table,
   but also storing info about publisher
*/
create table if not exists Book
(
    bookId int not null primary key,
    bookName text,
    publisher text
);
/* Same motivation as School table */
create table if not exists Course
(
    courseId int not null primary key,
    courseName text
);

/* Main table */
create table if not exists LoanBooks
(
  loanId int not null primary key,
  schoolId int,
  FOREIGN KEY (schoolId) REFERENCES School(schoolId),
  teacherId int,
  FOREIGN KEY (teacherId) REFERENCES Teacher(teacherId),
  courseId int,
  FOREIGN KEY (courseId) REFERENCES Course(courseId),
  room text,
  grade text,
  bookId int,
  FOREIGN KEY (bookId) REFERENCES Book(bookId),
  loanDate text
);