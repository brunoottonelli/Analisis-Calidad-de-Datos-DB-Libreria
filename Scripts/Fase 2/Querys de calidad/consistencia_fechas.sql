CREATE OR ALTER PROCEDURE consistencia_fechas
AS
BEGIN
	IF OBJECT_ID('tempdb..#ISBNFechas') IS NOT NULL
		DROP TABLE #ISBNFechas

	DELETE FROM TemporalConsistenciaFechas

	INSERT INTO TemporalConsistenciaFechas (ISBN, ReviewTime, BookTime)
	SELECT
		rat.ISBN,
		CASE WHEN TRY_CAST(review_time AS FLOAT) IS NULL THEN 
			NULL
		ELSE 
			DATEADD(SECOND,CAST(rat.review_time AS FLOAT),'1970-01-01') 
		END,
		(SELECT TOP 1 TRY_CAST(bok.PublisherDate AS DATETIME) FROM PruebaLocal2.dbo.NL_BOOKS AS bok WHERE rat.ISBN = bok.ISBN) 
	FROM
		PruebaLocal2.dbo.NL_RATINGS AS rat
END


