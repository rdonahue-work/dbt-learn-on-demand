with customers as (

    select * from {{ ref('stg_customers')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments')}}
)

select 
    customer_id
    ,order_id
    ,amount
from customers
left join orders 
    on orders.customer_id = customer.customer_id
left join payments
    on payments.order_id = orders.order_id
