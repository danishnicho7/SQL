CREATE OR REPLACE TRIGGER TRG_STUDENT_BOOK_LIMIT

BEFORE INSERT ON ISSUED_BOOKS

FOR EACH ROW

DECLARE

    v_count NUMBER;

BEGIN

    SELECT COUNT(*)
    INTO v_count
    FROM ISSUED_BOOKS
    WHERE STUDENT_ID = :NEW.STUDENT_ID
    AND STATUS = 'Issued';

    IF v_count >= 3 THEN

        RAISE_APPLICATION_ERROR
        (
            -20002,
            'Student already has maximum allowed books.'
        );

    END IF;

END;
/