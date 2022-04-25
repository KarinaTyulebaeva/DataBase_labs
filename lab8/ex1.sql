select * 
from customer;

explain
select * 
from customer;
-- cost=0.00..4032

explain 
select C.id, C.name, C.address
from customer as C
where C.id > 99000;
-- cost=0.29..13

explain
select *
from customer as C
where C.name = 'Lori Grant';
-- cost=0.00..4282

explain
select *
from customer
where id in (234, 45455, 1, 44444);
-- cost=0.29..21

create index name_id
on customer
using btree(name)

create index id_id
on customer
using hash(id);

explain 
select C.id, C.name, C.address
from customer as C
where C.id > 99000;
-- cost=0.29..13

explain
select *
from customer as C
where C.name = 'Lori Grant';
-- cost=0.00..4

explain
select *
from customer
where id in (234, 45455, 1, 44444);
-- cost=0.29..21