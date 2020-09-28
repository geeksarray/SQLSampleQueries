    --syntax
    SELECT Column1, Column2, [Column3]
    FROM (SELECT Columns FROM Table_name1) <Alias>
    PIVOT
    ( 
        aggregation_function (column)
        For Pivot_column<column to be pivoted, to become column header>
        IN ( Pivot_Column1, Pivot Column2, ….)
    ) AS <Alias >
    <OrderBy clause can be given which is optional>

    --Example
    CREATE TABLE StudentDetails
    (
        StudentName VARCHAR(80),
        Subject VARCHAR(59),
        Marks INT
    )

    INSERT INTO StudentDetails
    VALUES ('Tim Paul',
            'Physics',
            85)
    INSERT INTO StudentDetails
    VALUES ('Tim Paul',
            'Chemistry',
            67)
    INSERT INTO StudentDetails
    VALUES ('Tim Paul',
            'Maths',
            70)
     -----------------------

    INSERT INTO StudentDetails
    VALUES ('Branda Johnson',
            'Physics',
            65)
    INSERT INTO StudentDetails
    VALUES ('Branda Johnson',
            'Chemistry',
            78)
    INSERT INTO StudentDetails
    VALUES ('Branda Johnson',
            'Maths',
            70)
    ----------------------------------

    INSERT INTO StudentDetails
    VALUES ('Kate Berg',
            'Physics',
            70)
    INSERT INTO StudentDetails
    VALUES ('Kate Berg',
            'Chemistry',
            87)
    INSERT INTO StudentDetails
    VALUES ('Kate Berg',
            'Maths',
            90)
     --------------------------------

    INSERT INTO StudentDetails
    VALUES ('John Sean',
            'Physics',
            60)
    INSERT INTO StudentDetails
    VALUES ('John Sean',
            'Chemistry',
            67)
    INSERT INTO StudentDetails
    VALUES ('John Sean',
            'Maths',
            65)

    --Pivot Student data
    SELECT *
    FROM 
    (
        SELECT
        Studentname, Subject, Marks
        FROM StudentDetails
    ) as s
    PIVOT
    (
         SUM(Marks)
         FOR [Subject] IN (Physics,Chemistry,Maths)
    )
    AS Pivot_alias
 