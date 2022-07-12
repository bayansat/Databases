/* 1 */

SELECT course_id,title
FROM course
WHERE credits > 3;

SELECT building, room_number
FROM classroom
WHERE building = 'Watson' OR building = 'Packard';

SELECT course_id, title
FROM course
WHERE dept_name = 'Comp. Sci.';

SELECT course.course_id, course.title
FROM course, section
WHERE course.course_id = section.course_id AND section.semester = 'Fall';

SELECT id, name
FROM student
WHERE tot_cred > 45 AND tot_cred < 90;

SELECT id, name
FROM student
WHERE name LIKE '%a' OR name LIKE '%e' OR name LIKE '%i' OR name LIKE '%o' OR name LIKE '%u' OR name LIKE '%y';

SELECT course.course_id, course.title
FROM course, prereq
WHERE course.course_id = prereq.course_id AND prereq_id = 'CS-101';


/* 2 */
SELECT dept_name,avg(salary) AS average_salary_of_department
FROM instructor
ORDER BY average_salary_of_department
GROUP BY dept_name;

SELECT building, count(building)
FROM section
GROUP BY building
LIMIT 1;

SELECT department.dept_name, count(course.dept_name)
FROM department, course
WHERE department.dept_name = course.dept_name
GROUP BY department.dept_name
HAVING count(course.dept_name) = 1;

SELECT student.name, count(student.name)
FROM student, takes
WHERE student.id = takes.id AND student.dept_name = 'Comp. Sci.'
GROUP BY student.id, student.name
HAVING count(student.name) > 3;

SELECT name
FROM instructor
WHERE dept_name = 'Biology' OR dept_name = 'Philosophy' OR dept_name = 'Music';

SELECT DISTINCT instructor.id, instructor.name
FROM instructor, teaches
WHERE instructor.id = teaches.id AND teaches.year = '2018' AND instructor.id NOT IN
(SELECT instructor.id FROM instructor,teaches
WHERE instructor.id = teaches.id AND teaches.year = '2017');


/* 3 */
SELECT student.id, student.name
FROM takes, student
WHERE takes.course_id IN (SELECT course_id FROM corse WHERE course.dept_name = 'Comp. Sci.')
AND student.id = takes.id AND (takes.grade = 'A' OR takes.grade = 'A-')
GROUP BY student.name;

SELECT advisor.i_id, instructor.name
FROM advisor, takes, instructor, student
WHERE instructor.id = advisor.i_id AND student.id = advisor.s_id AND NOT (takes.grade = 'A' OR takes.grade = 'A-' OR
takes.grade = 'B+' OR takes.grade = 'B');

SELECT student.dept_name
FROM student, takes
WHERE student.id = takes.id AND student.dept_name NOT IN
(SELECT student.dept_name
 FROM student, takes
 WHERE student.id = takes.id AND (takes.grade = 'F' OR takes.grade = 'C-' OR takes.grade = 'C' OR takes.grade = 'C+'));

SELECT instructor.id, instructor.name
FROM instructor, teaches
WHERE instructor.id = teaches.id AND instructor.id NOT IN
(SELECT teaches.id FROM teaches, takes WHERE takes.course_id = teaches.course_id AND takes.grade = 'A');

SELECT course.course_id, course.title
FROM course, time_slot, section
WHERE section.time_slot_id = time_slot.time_slot_id AND course.course_id = section.course_id AND course.course_id IN (SELECT section.course_id FROM time_slot, section
                                                                                                                      WHERE time_slot.end_hr < 13 AND section.time_slot_id = time_slot.time_slot_id);
