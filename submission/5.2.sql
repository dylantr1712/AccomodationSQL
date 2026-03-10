WITH accommodation_rating AS (
    SELECT
        f.AccommodationID,
        a.AccommodationTypeID,
        ROUND(AVG(LENGTH(f.Rating)), 2) AS AvgRating,
        COUNT(*) AS ReviewCount
    FROM FEEDBACK f
    JOIN ACCOMMODATION a
        ON f.AccommodationID = a.AccommodationID
    GROUP BY
        f.AccommodationID,
        a.AccommodationTypeID
),
rating_with_type_avg AS (
    SELECT
        ar.AccommodationID,
        ar.AccommodationTypeID,
        ar.AvgRating,
        ar.ReviewCount,
        ROUND(AVG(ar.AvgRating) OVER (PARTITION BY ar.AccommodationTypeID), 2) AS TypeAvgRating
    FROM accommodation_rating ar
)
SELECT
    rwta.AccommodationID,
	a.AccommodationName,
    t.AccommodationType,
    rwta.AvgRating,
    rwta.ReviewCount,
    rwta.TypeAvgRating,
    ROUND(rwta.AvgRating - rwta.TypeAvgRating, 2) AS RatingDeviation
FROM rating_with_type_avg rwta
JOIN ACCOMMODATION_TYPE t
   		ON rwta.AccommodationTypeID = t.AccommodationTypeID
JOIN ACCOMMODATION a
        ON rwta.AccommodationID = a.AccommodationID
WHERE rwta.AvgRating > 4
ORDER BY
    rwta.AvgRating DESC,
    RatingDeviation DESC,
    rwta.AccommodationID ASC;