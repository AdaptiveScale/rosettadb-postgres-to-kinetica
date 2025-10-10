with payments as (
	select
		payment_id,
		customer_id,
		amount,
		payment_date,
		payment_method
	from {{ source('public', 'payments') }}
)

select * from payments