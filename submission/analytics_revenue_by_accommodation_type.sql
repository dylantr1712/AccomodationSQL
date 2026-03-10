WITH booking_base AS (
    SELECT
        b.BookingID,
        a.AccommodationTypeID,
        t.AccommodationType,
        a.PricePerNight,
        b.CheckInTime,
        b.CheckOutTime,
        b.VCCode,
        (b.CheckOutTime::timestamp::date - b.CheckInTime::timestamp::date) AS NumberOfNights
    FROM BOOKING b
    JOIN ACCOMMODATION a
        ON b.AccommodationID = a.AccommodationID
    JOIN ACCOMMODATION_TYPE t
        ON a.AccommodationTypeID = t.AccommodationTypeID
    WHERE b.DateTimeCancel IS NULL
),
booking_revenue AS (
    SELECT
        bb.BookingID,
        bb.AccommodationTypeID,
        bb.AccommodationType,
        bb.NumberOfNights,
        bb.PricePerNight,
        COALESCE(
            CASE
                WHEN vc.DiscountUnit = '%' THEN (bb.PricePerNight * bb.NumberOfNights) * (vc.DiscountValue / 100.0)
                WHEN vc.DiscountUnit = 'VND' THEN vc.DiscountValue
                ELSE 0
            END,
            0
        ) AS DiscountAmount,
        (bb.PricePerNight * bb.NumberOfNights) -
        COALESCE(
            CASE
                WHEN vc.DiscountUnit = '%' THEN (bb.PricePerNight * bb.NumberOfNights) * (vc.DiscountValue / 100.0)
                WHEN vc.DiscountUnit = 'VND' THEN vc.DiscountValue
                ELSE 0
            END,
            0
        ) AS Revenue
    FROM booking_base bb
    LEFT JOIN VOUCHER_COUPON vc
        ON bb.VCCode = vc.VCCode
),
type_summary AS (
    SELECT
        AccommodationType,
        COUNT(BookingID) AS TotalBookings,
        ROUND(COUNT(BookingID) * 100.0 / SUM(COUNT(BookingID)) OVER (), 2) AS BookingPercentage,
        ROUND(AVG(NumberOfNights), 2) AS AvgLengthOfStay,
        ROUND(SUM(Revenue), 2) AS TotalRevenue
    FROM booking_revenue
    GROUP BY AccommodationType
),

SELECT
    AccommodationType,
    TotalBookings,
    BookingPercentage,
    AvgLengthOfStay,
    TotalRevenue,
    CASE
        WHEN TotalRevenue > AVG(TotalRevenue) OVER () THEN 'Above Average'
        WHEN TotalRevenue < AVG(TotalRevenue) OVER () THEN 'Below Average'
        ELSE 'Equal to Average'
    END AS RevenueComparison
FROM type_summary
ORDER BY TotalRevenue DESC;