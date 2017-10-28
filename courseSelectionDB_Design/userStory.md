1. As a professor, I want to know who is the top student (with the highest mark) of the courses.

   ```mysql
   SELECT t1.* FROM score t1,
   (SELECT courseID, max(score) as score FROM score GROUP BY courseID) t2
   WHERE t1.courseID = t2.courseID and t1.score=t2.score;
   ```

2. As a student whose UNI is jc4833, I want to know the courses I have selected. (Select specific course information (sectionID, section location, section time, and courName) and the student's firstName and uni from a student whose uni is jc4833.)
   ```mysql
   SELECT studentSecCou.uni,studentSecCou.firstName,studentSecCou.sectionID,studentSecCou.location, studentSecCou.time,courses.courseName FROM
   (SELECT studentSection.uni,studentSection.firstName, studentSection.sectionID, section.courseID, section.location, section.time FROM
   	(SELECT st.uni, st.firstName, se.sectionID FROM student as st
   		INNER JOIN student_has_section as se
   		ON st.uni=se.uni
   		WHERE st.uni='jc4833') as studentSection,
   	section WHERE studentSection.sectionID = section.sectionID) as studentSecCou,
   	courses WHERE studentSecCou.courseID = courses.courseID;
   ```

3. As a professor whose facultyID is ‘q1234’, I want to know the information of courses which I will teach. (Select the course information(courseName, description, semester) which will be taught by professor whose facultyID is 'q1234'.)
   ```mysql
   SELECT courses.courseName,courses.description, courses.semester FROM
   (SELECT courseID FROM section WHERE facultyID='q1234') as s,
   courses WHERE s.courseID = courses.courseID GROUP BY courses.courseID;
   ```

4. As an administrator, I want to see all TA’s information. (Select all TA's information, their uni, course name, and session location, session address.)
   ```mysql
   SELECT se.uni,se.time,se.location,courses.courseName FROM
   (SELECT ta.uni,section.time,section.location,section.courseID 
   FROM ta,section WHERE ta.sectionID=section.sectionID) as se,
   courses WHERE se.courseID = courses.courseID;
   ```

5. As a professor, I am looking for some students as TA, and the requirements are the student must have already taken course which courseID is 1 and the score must be >= 90. (Select all possible students who has already taken course(courseID=1) and score is >= 90 as TA.)
   ```mysql
   SELECT * FROM score WHERE courseID = 1 AND score >= 90;
   ```

6. As a professor, I want to find some students who want to take ‘Advanced Database’ and have already taken ‘Introduction to Databases’. And I want to see theses students’ introduction to Databases’s score. Maybe I will let some students with high mark to enroll in Advanced Databases.
   ```mysql
   SELECT poss.uni,score.score FROM
   (SELECT * FROM student_has_section WHERE sectionID=5 AND enrolled='waitlisted') as poss
   INNER JOIN score WHERE score.uni=poss.uni;
   ```

7. There is a course which does not have any professor to teach.

   ```mysql
   SELECT courses.courseID, courses.courseName,courses.departmentID FROM
   (SELECT courses.courseID FROM courses 
   INNER JOIN section WHERE courses.courseID=section.courseID 
   GROUP BY courses.courseID) as hasProf 
   RIGHT JOIN courses ON hasProf.courseID=courses.courseID WHERE hasProf.courseID is NULL;
   ```

8. As a professor, he want to know which courses student in his class have taken.

   ```mysql
   SELECT courses.courseID, courses.courseName FROM
   (SELECT score.courseID FROM
   (SELECT uni FROM student_has_section WHERE sectionID=5) as stu 
   INNER JOIN score WHERE stu.uni = score.uni
   GROUP BY courseID)as takenCourse, courses WHERE takenCourse.courseID=courses.courseID;
   ```

9. As an administrator, I want to know what percentage of student take course1 and course3.

   ```mysql
   SELECT count(bothc.uni) as NumbothSelected, allstu.uni as AllStu, 
   concat(count(bothc.uni)/allstu.uni*100,'%') as Percentage
   FROM
   (SELECT c1.uni FROM
   (SELECT * FROM score WHERE courseID=1) as c1
   INNER JOIN (SELECT * FROM score WHERE courseID=3) 
   as c2 WHERE c1.uni=c2.uni) as bothc,(SELECT COUNT(uni)as uni FROM student) as allstu;
   ```

10. As an administrator, I want to know the section enrollment based on course time of 'MW8:40am-9:55am'

  ```mysql
  SELECT SUM(maxStudent),SUM(enrolled), 
  concat(SUM(enrolled)/SUM(maxStudent)*100,'%') as Percentage FROM section 
  WHERE time='MW8:40am-9:55am';
  ```

  ​

