with orders as (select * from {{ ref('stg_order')}}),
payments as (select * from {{ ref('stg_payments')}}),

final as (
    select o.order_id, o.customer_id, o.order_date, sum(p.amount) as amount
    from orders o
    left join payments p on o.order_id = p.order_id 
    group by o.order_id, o.customer_id, o.order_date
)

select * from final