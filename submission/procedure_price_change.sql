CREATE PROCEDURE price_change(
    p_accommodationid VARCHAR(20),
    p_price_change DECIMAL(10,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE accommodation
    SET pricepernight = pricepernight + p_price_change
    WHERE accommodationid = p_accommodationid;
END;
$$;

CALL price_change('ACM000000001', -89)

SELECT accommodationid, pricepernight
FROM accommodation
WHERE accommodationid = 'ACM000000001';