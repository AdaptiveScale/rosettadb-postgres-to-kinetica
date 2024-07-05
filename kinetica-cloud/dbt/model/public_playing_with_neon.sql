with playing_with_neon as (
	select
		id,
		name,
		value
	from {{ source('public', 'playing_with_neon') }}
)

select * from playing_with_neon