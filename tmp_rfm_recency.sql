insert into analysis.tmp_rfm_recency
select id as user_id,
		ntile(5) over (order by MAX(o.order_ts) nulls first) as recency
from analysis.users u
left join (select order_ts,
		          user_id
		   from analysis.orders
		   where status = 4 and extract(year from order_ts) = 2022) o
	on u.id=o.user_id
group by id;