create or replace function address_retriever()
returns table (
	address character varying(50),
	address_id int
)
as $$
begin
	return query
	select add.address, add.address_id
	from address as address
	where address.address like '%11%' and address.city_id > 400 and address.city_id < 600;
end;
$$
language plpgsql;