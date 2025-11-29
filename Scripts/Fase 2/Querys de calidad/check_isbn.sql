CREATE OR ALTER PROCEDURE check_isbn
AS
BEGIN
	DELETE TemporalValidISBN

	INSERT INTO TemporalValidISBN(ISBN,IsValid)
	SELECT
		bok.ISBN,
		CASE WHEN LEN(TRIM(bok.ISBN)) = 10 THEN 
				CASE WHEN ISNUMERIC(SUBSTRING(bok.ISBN,0,9)) = 1 AND
				 		  ( (SUBSTRING(bok.ISBN,1,1)) +     (SUBSTRING(bok.ISBN,2,1) * 2) +
							(SUBSTRING(bok.ISBN,3,1) * 3) + (SUBSTRING(bok.ISBN,4,1) * 4) +
							(SUBSTRING(bok.ISBN,5,1) * 5) + (SUBSTRING(bok.ISBN,6,1) * 6) +
							(SUBSTRING(bok.ISBN,7,1) * 7) + (SUBSTRING(bok.ISBN,8,1) * 8) +
							(SUBSTRING(bok.ISBN,9,1) * 9)  +
						   ((CASE WHEN SUBSTRING(bok.ISBN,10,1) = 'X' OR SUBSTRING(bok.ISBN,10,1) = 'x' THEN 10 ELSE SUBSTRING(bok.ISBN,10,1) END) * 10) ) % 11 = 0
					 THEN 1 ELSE 0 END
			 WHEN LEN(TRIM(bok.ISBN)) = 13 THEN 
				CASE WHEN ISNUMERIC(SUBSTRING(bok.ISBN,1,13)) = 1 AND
				 			10 - ((SUBSTRING(bok.ISBN,1,1) + (SUBSTRING(bok.ISBN,2,1) * 3) +
								   SUBSTRING(bok.ISBN,3,1) + (SUBSTRING(bok.ISBN,4,1) * 3) +
								   SUBSTRING(bok.ISBN,5,1) + (SUBSTRING(bok.ISBN,6,1) * 3) +
								   SUBSTRING(bok.ISBN,7,1) + (SUBSTRING(bok.ISBN,8,1) * 3) +
								   SUBSTRING(bok.ISBN,9,1) + (SUBSTRING(bok.ISBN,10,1) * 3) +
								   SUBSTRING(bok.ISBN,11,1) + (SUBSTRING(bok.ISBN,12,1) * 3)
								   ) % 10) = SUBSTRING(bok.ISBN,13,1)
					 THEN 1 ELSE 0 END
			 ELSE 0 END

	FROM
		PruebaLocal2.dbo.NL_BOOKS bok

END

