--------------------------------------------------
-- INSERT BOOKS
--------------------------------------------------

BEGIN
    FOR i IN 1..250 LOOP

        INSERT INTO BOOKS
        (
            TITLE,
            AUTHOR,
            CATEGORY,
            ISBN,
            QUANTITY,
            AVAILABLE
        )
        VALUES
        (
            'Book ' || i,

            'Author ' || i,

            CASE MOD(i,8)
                WHEN 0 THEN 'Programming'
                WHEN 1 THEN 'AI'
                WHEN 2 THEN 'Database'
                WHEN 3 THEN 'Networking'
                WHEN 4 THEN 'Cybersecurity'
                WHEN 5 THEN 'Cloud Computing'
                WHEN 6 THEN 'Web Development'
                ELSE 'Data Science'
            END,

            'ISBN' || TO_CHAR(1000 + i),

            TRUNC(DBMS_RANDOM.VALUE(5,25)),

            TRUNC(DBMS_RANDOM.VALUE(1,20))
        );

    END LOOP;

    COMMIT;
END;
/

--------------------------------------------------
-- INSERT STUDENTS
--------------------------------------------------

BEGIN

    FOR i IN 1..250 LOOP

        INSERT INTO STUDENTS
        (
            NAME,
            DEPARTMENT,
            EMAIL,
            PHONE
        )
        VALUES
        (
            'Student ' || i,

            CASE MOD(i,6)
                WHEN 0 THEN 'Computer Science'
                WHEN 1 THEN 'Information Technology'
                WHEN 2 THEN 'Electronics'
                WHEN 3 THEN 'Mechanical'
                WHEN 4 THEN 'Civil Engineering'
                ELSE 'Artificial Intelligence'
            END,

            'student' || i || '@example.com',

            '98' || LPAD(i,8,'0')
        );

    END LOOP;

    COMMIT;
END;
/

--------------------------------------------------
-- INSERT ISSUED BOOKS
--------------------------------------------------

DECLARE

    v_book_id NUMBER;
    v_student_id NUMBER;

BEGIN

    FOR i IN 1..300 LOOP

        SELECT BOOK_ID
        INTO v_book_id
        FROM
        (
            SELECT BOOK_ID
            FROM BOOKS
            ORDER BY DBMS_RANDOM.VALUE
        )
        WHERE ROWNUM = 1;

        SELECT STUDENT_ID
        INTO v_student_id
        FROM
        (
            SELECT STUDENT_ID
            FROM STUDENTS
            ORDER BY DBMS_RANDOM.VALUE
        )
        WHERE ROWNUM = 1;

        INSERT INTO ISSUED_BOOKS
        (
            BOOK_ID,
            STUDENT_ID,
            ISSUE_DATE,
            RETURN_DATE,
            STATUS
        )
        VALUES
        (
            v_book_id,

            v_student_id,

            SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1,60)),

            CASE
                WHEN MOD(i,2)=0
                THEN SYSDATE - TRUNC(DBMS_RANDOM.VALUE(0,30))
                ELSE NULL
            END,

            CASE
                WHEN MOD(i,2)=0
                THEN 'Returned'
                ELSE 'Issued'
            END
        );

    END LOOP;

    COMMIT;
END;
/

--------------------------------------------------
-- USER ROLES
--------------------------------------------------

INSERT INTO USER_ROLES VALUES ('ADMIN', 'ADMIN');

INSERT INTO USER_ROLES VALUES ('LIBRARIAN1', 'LIBRARIAN');

INSERT INTO USER_ROLES VALUES ('STUDENT1', 'STUDENT');

INSERT INTO USER_ROLES
VALUES
(
    'DANISHNICHO7@GMAIL.COM',
    'ADMIN'
);

COMMIT;