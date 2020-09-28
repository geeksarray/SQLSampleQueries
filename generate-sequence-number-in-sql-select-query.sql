CREATE TABLE StudentTotalMarks
( 
   StudentName VARCHAR(80),
   MarksObtained INT,
   TotalMarks INT
)

GO

INSERT INTO StudentTotalMarks VALUES ('Tim Paul', 476, 500)

INSERT INTO StudentTotalMarks VALUES ('Branda Johnson', 450, 500)

INSERT INTO StudentTotalMarks VALUES ('Kate Berg', 356, 500)

INSERT INTO StudentTotalMarks VALUES ('John Sean', 476, 500)

INSERT INTO StudentTotalMarks VALUES ('Petro Smith', 450, 500)

INSERT INTO StudentTotalMarks VALUES ('Suzie Brown', 450, 500)

INSERT INTO StudentTotalMarks VALUES ('Rebecca Wilson', 489, 500)

INSERT INTO StudentTotalMarks VALUES ('Charles Davis', 476, 500)

INSERT INTO StudentTotalMarks VALUES ('Anna Taylor', 390, 500)

INSERT INTO StudentTotalMarks VALUES ('Sean Jones', 455, 500)

INSERT INTO StudentTotalMarks VALUES ('Mike Jackson', 356, 500)
GO

Select StudentName,MarksObtained,
ROW_NUMBER() OVER(ORDER BY MarksObtained DESC) AS Rank
FROM StudentTotalMarks
GO

SELECT StudentName, MarksObtained,
RANK() Over(ORDER BY MarksObtained DESC) AS Rank
FROM StudentTotalMarks
GO

SELECT StudentName, MarksObtained, c.CourseID, c.CourseName
RANK() Over(ORDER BY MarksObtained DESC) AS Rank
FROM StudentTotalMarks S
JOIN CourseDetails C ON C.CourseID = S.CourseID 
GO


                