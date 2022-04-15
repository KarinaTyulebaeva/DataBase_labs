create or replace function retrieve_customers(start_id int, end_id int)
returns table (
	customer int,
	address int
)
as $$
begin
    if end_id <= 0 or start_id <= 0 or start_id > = end_id or end_id >= 600 then
        raise notice 'the start index(%) or end index(%) is out of bounds', start_id, end_id;
    end if;

	return query
	select C.customer_id, c.address_id
	from customer as C
	where C.address_id not in (select C2.address_id
							  from customer as C2
							  order by C2.address_id
							  limit (start_id))
	order by C.address_id
	limit (end_id);
end;
$$
language plpgsql;