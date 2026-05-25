--------------------------------------------------
-- OVERDUE BOOKS REPORT
--------------------------------------------------

SELECT
    I.ISSUE_ID,
    B.TITLE AS BOOK_NAME,
    S.NAME AS STUDENT_NAME,
    I.ISSUE_DATE,

    TRUNC(SYSDATE - I.ISSUE_DATE) AS DAYS_ISSUED,

    CASE

        WHEN TRUNC(SYSDATE - I.ISSUE_DATE) <= 15
        THEN TRUNC(SYSDATE - I.ISSUE_DATE) * 5

        WHEN TRUNC(SYSDATE - I.ISSUE_DATE) <= 30
        THEN
            (15 * 5) +
            ((TRUNC(SYSDATE - I.ISSUE_DATE) - 15) * 10)

        ELSE
            (15 * 5) +
            (15 * 10) +
            ((TRUNC(SYSDATE - I.ISSUE_DATE) - 30) * 20)

    END AS FINE_AMOUNT

FROM ISSUED_BOOKS I

JOIN BOOKS B
ON I.BOOK_ID = B.BOOK_ID

JOIN STUDENTS S
ON I.STUDENT_ID = S.STUDENT_ID

WHERE I.STATUS = 'Issued'

AND TRUNC(SYSDATE - I.ISSUE_DATE) > 15

ORDER BY I.ISSUE_DATE;