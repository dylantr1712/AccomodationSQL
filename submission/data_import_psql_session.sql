//Use psql to import data to PostgreSQL

JRM=# \copy PROVINCE FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/PROVINCE.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 63
JRM=#
JRM=# \copy ACCOMMODATION_TYPE FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/ACCOMMODATION_TYPE.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 10
JRM=#
JRM=# \copy AMENITIES FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/AMENITIES.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 12
JRM=#
JRM=# \copy FACILITIES FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/FACILITIES.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 10
JRM=#
JRM=# \copy GUEST_ACCOUNT FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/GUEST_ACCOUNT.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 909
JRM=#
JRM=# \copy OWNER_ACCOUNT FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/OWNER_ACCOUNT.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 623
JRM=#
JRM=# \copy VOUCHER_COUPON FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/VOUCHER_COUPON.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 1000
JRM=#
JRM=# \copy CITY_DISTRICT FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/CITY_DISTRICT.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 705
JRM=#
JRM=# \copy ACCOMMODATION FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/ACCOMMODATION.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 637
JRM=#
JRM=# \copy BOOKING FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/BOOKING.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 421
JRM=#
JRM=# \copy PAYMENT FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/PAYMENT.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 421
JRM=#
JRM=# \copy AMENITIES_INCLUDED FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/AMENITIES_INCLUDED.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 636
JRM=#
JRM=# \copy FACILITIES_INCLUDED FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/FACILITIES_INCLUDED.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 617
JRM=#
JRM=# \copy FEEDBACK FROM 'C:/Users/tridu/Downloads/DE Entry Test/DE Entry Test/SQL Test/data/utf8/FEEDBACK.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY 569