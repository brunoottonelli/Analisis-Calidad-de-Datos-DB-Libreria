CREATE OR ALTER PROCEDURE consistencia_ratings
AS
BEGIN
	IF OBJECT_ID('tempdb..#ISBNRatings') IS NOT NULL
		DROP TABLE #ISBNRatings
	IF OBJECT_ID('tempdb..#ISBNBooks') IS NOT NULL
		DROP TABLE #ISBNBooks

	DELETE FROM TemporalConsistenciaRatings

	CREATE TABLE #ISBNRatings(ISBN VARCHAR(50) PRIMARY KEY, Rating INT NOT NULL)
	CREATE TABLE #ISBNBooks(ISBN VARCHAR(50), Rating NUMERIC(20,2) NOT NULL)

	CREATE NONCLUSTERED INDEX IndiceLibros ON #ISBNBooks(ISBN)

	INSERT INTO #ISBNRatings
	SELECT 
		rat.ISBN, 
		COUNT(*) AS RatingBooks
	FROM 
		PruebaLocal2.dbo.NL_RATINGS rat 
	GROUP BY 
		rat.ISBN

	INSERT INTO #ISBNBooks
	SELECT 
		bok.ISBN, 
		CASE WHEN (bok.RatingCount IS NULL OR LEN(TRIM(bok.RatingCount)) = 0 OR ISNUMERIC(bok.RatingCount) = 0) THEN 0.0 ELSE CAST(bok.RatingCount AS NUMERIC(20,2)) END 
	FROM 
		PruebaLocal2.dbo.NL_BOOKS bok

	INSERT INTO TemporalConsistenciaRatings(ISBN,CantidadRatingBooks,CantidadRatingRating)
	SELECT 
		bok.ISBN,bok.Rating,rat.Rating 
	FROm 
		#ISBNBooks bok
			JOIN #ISBNRatings rat ON bok.ISBN = rat.ISBN
	GROUP BY
		bok.ISBN,bok.Rating,rat.ISBN,rat.Rating
END

