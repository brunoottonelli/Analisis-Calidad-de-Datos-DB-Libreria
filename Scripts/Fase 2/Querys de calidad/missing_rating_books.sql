CREATE OR ALTER PROCEDURE missing_rating_books
AS
BEGIN
	DELETE FROM TemporalMissingRatingBooks

	INSERT INTO TemporalMissingRatingBooks (ISBN, IsValid)
	SELECT
		rat.ISBN,
		CASE WHEN bok.ISBN IS NULL THEN 0 ELSE 1 END
	FROM
		PruebaLocal2.dbo.NL_RATINGS AS rat
			LEFT JOIN PruebaLocal2.dbo.NL_BOOKS bok ON rat.ISBN = bok.ISBN
END

