CREATE TABLE AccommodationPriceHistory (
	HistoryID SERIAL PRIMARY KEY,
	AccommodationID VARCHAR(20) REFERENCES ACCOMMODATION(AccommodationID),
	OldPrice DECIMAL(10,2),
	NewPrice DECIMAL(10,2),
	ChangeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	ChangedBy TEXT DEFAULT CURRENT_USER
)


CREATE OR REPLACE FUNCTION log_accommodation_price_change()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF OLD.PricePerNight <> NEW.PricePerNight THEN
        INSERT INTO AccommodationPriceHistory (
            AccommodationID,
            OldPrice,
            NewPrice,
            ChangeDate,
            ChangedBy
        )
        VALUES (
            NEW.AccommodationID,
            OLD.PricePerNight,
            NEW.PricePerNight,
            CURRENT_TIMESTAMP,
            CURRENT_USER
        );
    END IF;

    RETURN NEW;
END;
$$;


CREATE TRIGGER trg_accommodation_price_change
AFTER UPDATE ON Accommodation
FOR EACH ROW
EXECUTE FUNCTION log_accommodation_price_change();