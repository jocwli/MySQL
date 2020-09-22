/* Project_part2.sql
CS 155A, Spring 2018*/

USE University;

/* Query 01 */ 
/* Display courses that have the course ID EN100 as a prerequisite. 
This statement should return these columns: course_id, title, credits, dept_id, and prereq. */
SELECT *
FROM Course
WHERE prerequisite = "EN100";

/* Query 02 */
/*Display all course sections offered in Winter 2017. This statement should return these columns: course_id, section_id, and term_id. */
SELECT a.course_id, b.section_id, c.term_id
FROM course a
INNER JOIN section b ON a.course_id=b.course_id
INNER JOIN term c ON b.term_id=c.term_id
WHERE term_description="Winter 2017";

/* Query 03 */
/* Modify the title of course CIS253 from Database Systems to Introduction to Relational Databases. */
UPDATE course
SET title="Introduction to Relational Databases" 
WHERE course_id="CIS253";

SELECT *
FROM course;

/* Query 04 */
 /* Display the number of enrollments for section 1103 of Course ID MA150. 
 This statement should return these columns: section_id,  course_id and the number of enrollments. */
 SELECT a.section_id, a.course_id, count(b.student_id) as Num_enrollments
 FROM section a
 INNER JOIN registration b
 WHERE a.section_id = 1103 and a.course_id="MA150";
 
 /* Query 05 */
 /* Display the student roster (use the format: <last name>, <first name> in a single column) for each section taught by Professor Sen. 
 Identify the section using course ID and section ID. This statement should return these columns: course_id , section_id , last_name,  and first_name. */
 SELECT c.course_id, b.section_id, concat(a.last_name,", ", a.first_name) as student_roster
 FROM student a
 INNER JOIN registration b ON a.student_id=b.student_id
 INNER JOIN section c ON b.section_id=c.section_id
 INNER JOIN course d ON c.course_id=d.course_id
 INNER JOIN faculty e ON c.faculty_id=e.faculty_id
 WHERE e.name="Sen";
 
 /* Query 06 */
 /*Display a list of all departments, with the total number of instructors in each department, without using subqueries. 
 This statement should return these columns: dept_name and the total number of instructors*/
  SELECT a.dept_name, count(b.faculty_id) as total_num_instructors 
  FROM department a
  INNER JOIN faculty b ON a.dept_id=b.dept_id
  GROUP BY a.dept_name;
 
 /* Query 07 */
 /*. Display names of faculty members who work in department 4 or 5.  
 This statement should return these columns: faculty_id, name, and department_id. */
 SELECT a.faculty_id, a.name, b.dept_id
 FROM faculty a
 INNER JOIN department b ON a.dept_id=b.dept_id
 WHERE b.dept_id IN (4,5);
 
 /* Query 08 */
 /*. Display Winter 2017 course sections with the faculty member assigned to teach the class. 
 This statement should return these columns: course_id, section_id, and name.  */
 SELECT course_id, section_id, name
 FROM section a
 INNER JOIN term b ON a.term_id=b.term_id
 INNER JOIN faculty c ON a.faculty_id=c.faculty_id
 WHERE term_description= "Winter 2017";
 
/* Query 09 */
/* Display a student’s full name along with his/her major’s description. */
SELECT a.first_name, a.last_name, b.major_desc
FROM student a
INNER JOIN major b ON a.major_id=b.major_id;

/* Query 10 */
/* . Display names of students, who received an ‘A’ as their final grade in Winter 2017. */
SELECT last_name, first_name
FROM student a
INNER JOIN registration b ON a.student_id=b.student_id
WHERE final_grade="A";

/* Query 11 */
/* Display all information about instructors from the Computer Science department. */
SELECT b.*
FROM department a
INNER JOIN faculty b ON a.dept_id=b.dept_id
WHERE dept_name="Computer Science";

/* Query 12 */
/* Display the total enrollment for course CIS253 in a column named TOTAL ENROLLED. */
SELECT COUNT(DISTINCT student_id) as Total_enrolled
FROM section a 
INNER JOIN registration b ON a.section_id=b.section_id
INNER JOIN course c ON a.course_id=c.course_id
WHERE c.course_id="CIS253";

/* Query 13 */
/* Display course title, total capacity and number of sections in each course, where there is more than one section. */
SELECT a.title, sum(b.max_count) as total_capacity, count(DISTINCT b.section_id) num_sections
FROM course a
INNER JOIN section b ON a.course_id=b.course_id
GROUP BY a.title
HAVING count(DISTINCT b.section_id) > 1 ;
/*Intro = 165 and 4 sections ; systems = 95 and 3 sections */

/* Query 14 */
/* Create a view that lists all course sections offered by the Accounting department in the Winter 2017 */
CREATE VIEW all_accounting AS
SELECT section_id
FROM section a
INNER JOIN term b ON a.term_id=b.term_id
INNER JOIN course c ON a.course_id=c.course_id
INNER JOIN department d ON c.dept_id=d.dept_id
WHERE d.dept_name ="Accounting" and b.term_description="Winter 2017";

/* Query 15 */
/* Show all the sections whose registration is greater than two students. 
This statement should return these columns: course_id, section_id, and the number of enrollments. */
SELECT a.course_id, a.section_id, count(DISTINCT b.student_id) as num_enrolled
FROM section a
INNER JOIN registration b ON a.section_id=b.section_id
GROUP BY a.course_id, a.section_id
HAVING count(distinct b.student_id) > 2;