SELECT
    p.ProvinceName,
    COUNT(CASE WHEN at.AccommodationType = 'Bungalow' THEN 1 END) AS Bungalow,
    COUNT(CASE WHEN at.AccommodationType = 'Condotel' THEN 1 END) AS Condotel,
    COUNT(CASE WHEN at.AccommodationType = 'Duplex' THEN 1 END) AS Duplex,
    COUNT(CASE WHEN at.AccommodationType = 'Farmstay' THEN 1 END) AS Farmstay,
    COUNT(CASE WHEN at.AccommodationType = 'Homestay' THEN 1 END) AS Homestay,
    COUNT(CASE WHEN at.AccommodationType = 'Penthouse' THEN 1 END) AS Penthouse,
    COUNT(CASE WHEN at.AccommodationType = 'Resort' THEN 1 END) AS Resort,
    COUNT(CASE WHEN at.AccommodationType = 'Studio' THEN 1 END) AS Studio,
    COUNT(CASE WHEN at.AccommodationType = 'Treehouse' THEN 1 END) AS Treehouse,
    COUNT(CASE WHEN at.AccommodationType = 'Villa' THEN 1 END) AS Villa,
    COUNT(a.AccommodationID) AS TotalAccommodations
FROM PROVINCE p
JOIN CITY_DISTRICT cd
    ON p.ProvinceID = cd.ProvinceID
JOIN ACCOMMODATION a
    ON cd.CityDistrictID = a.CityDistrictID
JOIN ACCOMMODATION_TYPE at
    ON a.AccommodationTypeID = at.AccommodationTypeID
GROUP BY
    p.ProvinceName
ORDER BY
    TotalAccommodations DESC;