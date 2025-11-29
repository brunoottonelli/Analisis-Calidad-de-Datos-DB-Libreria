CREATE OR ALTER PROCEDURE check_date_format
AS
BEGIN
	DELETE TemporalDateFormatPublisher

	INSERT INTO TemporalDateFormatPublisher(ISBN,PublisherDate,IsValid)
	SELECT
		bok.ISBN,
		TRY_CAST(bok.PublisherDate AS VARCHAR(100)),
		CASE WHEN bok.PublisherDate IS NULL OR LEN(TRIM(bok.PublisherDate)) = 0 OR TRY_CAST(bok.PublisherDate AS DATETIME) IS NULL THEN 0 ELSE 1 END
	FROM
		PruebaLocal2.dbo.NL_BOOKS bok

	
	DELETE TemporalDateFormatReview

	INSERT INTO TemporalDateFormatReview(ISBN,review_time,IsValid)
	SELECT
		rat.ISBN,
		TRY_CAST(rat.review_time AS VARCHAR(100)),
		CASE WHEN TRY_CAST(review_time AS FLOAT) IS NULL THEN 
			0
		ELSE 
			1
		END
	FROM
		PruebaLocal2.dbo.NL_RATINGS AS rat
END

