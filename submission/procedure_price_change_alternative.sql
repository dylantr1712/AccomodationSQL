CREATE PROCEDURE price_change
	p_accommodationid VARCHAR(20)
	p_pricepernight DECIMAL(10,2)
AS
BEGIN
	UPDATE accommodation
	SET pricepernight = pricepernight + p_pricepernight
	WHERE accomodationid = p_accommodationid
END;