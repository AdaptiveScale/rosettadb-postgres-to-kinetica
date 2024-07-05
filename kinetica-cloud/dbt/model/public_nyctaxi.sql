with nyctaxi as (
	select
		vendor_id,
		pickup_datetime,
		dropoff_datetime,
		passenger_count,
		trip_distance,
		pickup_longitude,
		pickup_latitude,
		rate_code_id,
		store_and_fwd_flag,
		dropoff_longitude,
		dropoff_latitude,
		payment_type,
		fare_amount,
		surcharge,
		mta_tax,
		tip_amount,
		tolls_amount,
		total_amount,
		cab_type
	from {{ source('public', 'nyctaxi') }}
)

select * from nyctaxi