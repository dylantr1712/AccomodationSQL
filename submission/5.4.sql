CREATE OR REPLACE PROCEDURE search_accommodations(
    IN p_required_capacity INT,
    IN p_required_amenities TEXT,
    IN p_required_facilities TEXT,
    INOUT p_result REFCURSOR
)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN p_result FOR
    SELECT
        a.AccommodationID,
        a.AccommodationName,
        at.AccommodationType,
        a.PricePerNight,
        a.Capacity,
        a.NumberOfRooms
    FROM ACCOMMODATION a
    JOIN ACCOMMODATION_TYPE at
        ON a.AccommodationTypeID = at.AccommodationTypeID
    WHERE a.Capacity >= p_required_capacity

      AND (
            p_required_amenities IS NULL
            OR p_required_amenities = ''
            OR NOT EXISTS (
                SELECT 1
                FROM unnest(string_to_array(p_required_amenities, ',')) AS req_amenity(AmenityID)
                WHERE NOT EXISTS (
                    SELECT 1
                    FROM AMENITIES_INCLUDED ai
                    WHERE ai.AccommodationID = a.AccommodationID
                      AND ai.AmenityID = TRIM(req_amenity.AmenityID)
                )
            )
          )

      AND (
            p_required_facilities IS NULL
            OR p_required_facilities = ''
            OR NOT EXISTS (
                SELECT 1
                FROM unnest(string_to_array(p_required_facilities, ',')) AS req_facility(FacilityID)
                WHERE NOT EXISTS (
                    SELECT 1
                    FROM FACILITIES_INCLUDED fi
                    WHERE fi.AccommodationID = a.AccommodationID
                      AND fi.FacilityID = TRIM(req_facility.FacilityID)
                )
            )
          )
    ORDER BY a.PricePerNight ASC, a.AccommodationID ASC;
END;
$$;
