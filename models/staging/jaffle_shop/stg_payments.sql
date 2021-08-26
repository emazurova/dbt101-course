with payments as (

    select id,
        orderid as order_id,
        paymentmethod as payment_method, 
        status,
        {{ cents_to_dollars('amount', 4) }} as amount,
        created
    from {{ source('stripe_payments', 'stripe_payments')}}
)

select * from payments