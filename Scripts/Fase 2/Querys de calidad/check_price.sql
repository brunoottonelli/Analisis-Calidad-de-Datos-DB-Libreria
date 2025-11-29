CREATE OR ALTER PROCEDURE check_price
AS
BEGIN
	DELETE FROM TemporalCheckPrice

	INSERT INTO TemporalCheckPrice(ISBN,Price,IsValid)
	SELECT
		bok.ISBN,
		bok.Price,
		CASE 
			WHEN bok.Price IS NULL OR LEN(TRIM(bok.Price)) = 0 OR TRY_CAST(bok.Price AS FLOAT) IS NULL THEN 0
			WHEN TRY_CAST(bok.Price AS FLOAT) >=0 THEN 1
			ELSE 0
		END
	FROM
		PruebaLocal2.dbo.NL_BOOKS bok
END
