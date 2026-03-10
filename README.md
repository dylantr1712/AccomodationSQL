# AccommodationSQL

A PostgreSQL portfolio project that models an accommodation booking platform, loads realistic CSV data, and demonstrates procedural SQL + analytics workflows.

## Project highlights
- **Relational data modeling:** normalized schema for accounts, listings, bookings, payments, amenities/facilities, and feedback.
- **Data ingestion:** bulk import workflow using `psql \copy`.
- **Database programming:** stored procedures and trigger-based auditing in PL/pgSQL.
- **Analytics SQL:** CTE-driven business analysis for revenue, ratings, and inventory distribution.

## Tech stack
- PostgreSQL
- SQL / PL/pgSQL
- CSV datasets (`UTF-8` and `UTF-16` variants)

## Repository structure
```text
.
├── data/
│   ├── utf8/     # ready-to-import CSVs
│   └── utf16/    # same datasets in UTF-16
├── submission/
│   ├── erd_diagram.png
│   ├── schema_definition.sql
│   ├── data_import_psql_session.sql
│   ├── procedure_price_change.sql
│   ├── trigger_price_history_audit.sql
│   ├── procedure_price_change_alternative.sql
│   ├── procedure_screenshot.png
│   ├── analytics_revenue_by_accommodation_type.sql
│   ├── analytics_top_rated_accommodations.sql
│   ├── analytics_accommodation_type_distribution_by_province.sql
│   └── procedure_search_accommodations.sql
└── pgad.sql
```

## Data model
The schema includes entities for:
- `PROVINCE`, `CITY_DISTRICT`
- `OWNER_ACCOUNT`, `GUEST_ACCOUNT`
- `ACCOMMODATION`, `ACCOMMODATION_TYPE`
- `BOOKING`, `PAYMENT`, `VOUCHER_COUPON`
- `AMENITIES`, `FACILITIES` and bridge tables
- `FEEDBACK`

See:
- `submission/schema_definition.sql`
- `submission/erd_diagram.png`

## How to run locally
### 1) Create a database
```sql
CREATE DATABASE accommodation_sql;
```

### 2) Apply schema
```bash
psql -d accommodation_sql -f submission/schema_definition.sql
```

### 3) Load CSV data
Use the `\copy` sequence shown in:
- `submission/data_import_psql_session.sql`

> Tip: adjust file paths for your local machine. The committed session file preserves the original run transcript.

### 4) Run programming tasks
```bash
psql -d accommodation_sql -f submission/procedure_price_change.sql
psql -d accommodation_sql -f submission/trigger_price_history_audit.sql
psql -d accommodation_sql -f submission/procedure_search_accommodations.sql
```

### 5) Run analytics tasks
```bash
psql -d accommodation_sql -f submission/analytics_revenue_by_accommodation_type.sql
psql -d accommodation_sql -f submission/analytics_top_rated_accommodations.sql
psql -d accommodation_sql -f submission/analytics_accommodation_type_distribution_by_province.sql
```

## Featured SQL work
- **Price update procedure:** parameterized price adjustment for one accommodation.
- **Audit trigger:** tracks old/new prices and changer metadata.
- **Revenue analysis:** calculates stay nights, voucher discount impact, and revenue comparison by accommodation type.
- **Rating analysis:** compares listing-level rating performance vs type-level baseline.
- **Inventory distribution:** province-level pivot across accommodation types.
- **Search procedure:** filters accommodations by capacity + required amenity/facility lists.

## Portfolio notes
If showcasing this on GitHub/LinkedIn:
1. Add 1–2 screenshots of query outputs in `submission/` and reference them here.
2. Include short “business insight” bullets under each analytics script.
3. Pin this repository and summarize outcomes in your profile (schema design, ETL loading, PL/pgSQL, analytics SQL).

---
If useful, I can also generate a one-page **project summary** version of this README for recruiters.
