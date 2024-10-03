with customers as (
	select
		customer_id,
		first_name,
		last_name,
		email,
		phone,
		created_at
	from {{ source('public', 'customers') }}
)

select * from customers