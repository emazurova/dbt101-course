with payments as (

    select id,
        orderid as order_id,
        paymentmethod as payment_method, 
        status,
        amount / 100 as amount,
        created
    from stripe_payments.stripe_payments
)

select * from payments