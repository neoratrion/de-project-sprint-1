insert into analysis.tmp_rfm_monetary_value
select id as user_id,
	   ntile(5) over (order by sum(o.payment) nulls first) as monetary_value
from analysis.users u
left join (select order_ts,
		   		  user_id,
		   		  payment
		   from analysis.orders
		   where status = 4 and extract(year from order_ts) = 2022) o
	on u.id=o.user_id
group by id;