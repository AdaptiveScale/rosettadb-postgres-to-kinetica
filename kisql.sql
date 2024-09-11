LOAD INTO nuhibesimi_gmail.customers
FROM REMOTE QUERY 'SELECT * FROM public.customers'
WITH OPTIONS (DATA SOURCE = 'postgres_ds');

LOAD INTO nuhibesimi_gmail.nyctaxi
FROM REMOTE QUERY 'SELECT * FROM public.nyctaxi'
WITH OPTIONS (DATA SOURCE = 'postgres_ds');

LOAD INTO nuhibesimi_gmail.payments
FROM REMOTE QUERY 'SELECT * FROM public.payments'
WITH OPTIONS (DATA SOURCE = 'postgres_ds');

