LOAD INTO nuhibesimi_gmail.nyctaxi
FROM REMOTE QUERY 'SELECT * FROM public.nyctaxi'
WITH OPTIONS (DATA SOURCE = 'postgres_ds');

