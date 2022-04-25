select film_id
from (select f.film_id
	  from film as f left join (select *
						 from inventory as i join rental as r on i.inventory_id = r.inventory_id) as ri on ri.film_id = f.film_id
	  					where ri.film_id is NULL) as rif 
intersect select ff.film_id
		  from film as ff
		  where (ff.rating = 'R' or ff.rating = 'PG-13')
intersect select fc.film_id
		  from film_category as fc join category as c on fc.category_id = c.category_id 
		  where c.name = 'Sci-fi' OR c.name = 'Horror';

select store_id, city, res.total_amount
from (select store_id, c.city_id, sum(amount) as total_amount
      from payment as p join staff as s on p.staff_id = s.staff_id
	  			   join address as a on a.address_id = s.address_id
	  			   join city as c on a.city_id = c.city_id
	  where date('2007.05.14') - 30 < payment_date and payment_date < date('2007.05.14')
GROUP BY store_id, c.city_id) res join city on res.city_id=city.city_id;


