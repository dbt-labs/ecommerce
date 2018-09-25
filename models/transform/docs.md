{% docs ecommerce_customers %}

 The `customers` view joins together fields from the main ecommerce customer table with specific customer level information from orders. 
 
 The orders table creates several customer level values with window functions. These are things like `first_order_date` (the minimum `created_at` date for the given customer) and `lifetime_placed_orders` (total count of orders for the given customer). These are differentiated from `first_completed_order_date` and `lifetime_completed_orders` which filter out any orders that do not adhere to is_completed = TRUE. 
 
 These fields duplicate across the customers orders in the orders table (ie the `first_order_date` for customer 12345 is '2018-01-06' whether it is their first order or 10th). In order to avoid fan out, orders are filtered for just the customer's first order (order_seq_number = 1) before joining to customers. 

{% enddocs %}

{% docs order_calculations %}

 The `orders_calculations` model is an intermediate model that does all of the heavy lifting to create ecommerce order metrics. 
 
 This model utilizes a variety of window functions. Several of these are used to create customer level fields (like `first_order_date` - which is helpful for cohorting and `customer_first_30_day_revenue` - which is useful for understanding marketing breakeven figures). Several of the calculations are specific to the order (like `days_from_first_completed_order` - which is helpful for cohorting, `completed_order_number` and `days_since_previous_completed_order` - which is helpful for calculting things like average time between orders). 

{% enddocs %}

{% docs order_final %}

 The `orders_xf` table materializes as a table and removes an intermediate field created in `orders_calculations`. This should be the table used to query from in your BI tool for all things orders related. 

{% enddocs %}