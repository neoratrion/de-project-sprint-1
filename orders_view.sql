create or replace view analysis.orders as 
with osl as(
select order_id,
       status_id as status,
       row_number() over(partition by order_id order by dttm desc) as rn
from production.orderstatuslog)
select o.order_id,
       o.order_ts,
       o.user_id,
       o.bonus_payment,
       o.payment,
       o."cost",
       o.bonus_grant,
       osl.status
from production.orders as o
join osl on o.order_id=osl.order_id
where rn = 1;