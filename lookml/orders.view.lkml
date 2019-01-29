view: orders {
  sql_table_name: analytics.orders_xf ;;

#------------------------------------------ PRIMARY KEY

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

#------------------------------------------ IDS

  dimension: customer_id {
    description: "This is the user's customer ID"
    type: string
    sql: ${TABLE}.customer_id ;;
  }
  
#------------------------------------------ DATES

  dimension_group: created_at {
    description: "This is the timestamp that the order was created"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
    group_label: "Order Dates"
  }

  dimension_group: processed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.processed_at ;;
    group_label: "Order Dates"
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
    group_label: "Order Dates"
  }

  dimension_group: first_completed_order {
    description: "This is the customer's first completed order timestamp"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_completed_order_date ;;
    group_label: "Order Dates"
  }

  dimension_group: first_order {
    description: "This is the customer's first order timestamp"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_order_date ;;
    group_label: "Order Dates"
  }

  dimension_group: previous_completed_order {
    description: "This is the customer's previous completed order timestamp"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.previous_completed_order_date ;;
    group_label: "Order Dates"
  }


#------------------------------------------ ORDER ATTRIBUTES

  dimension: order_seq_number {
    hidden: yes
    type: string
    sql: ${TABLE}.order_seq_number ;;
  }

  dimension: order_year {
    description: "This truncates the order created date to the year"
    type: number
    sql: ${TABLE}.order_year ;;
    group_label: "Order Attributes"
  }

  dimension: order_month {
    description: "This truncates the order created date to the month"
    type: number
    sql: ${TABLE}.order_month ;;
    group_label: "Order Attributes"
  }

  dimension: order_day_of_month {
    description: "This truncates the order created date to the day"
    type: string
    sql: ${TABLE}.order_day_of_month ;;
  }

  dimension: completed_order_number {
    type: number
    sql: ${TABLE}.completed_order_number ;;
    group_label: "Order Attributes"
  }

  dimension: is_completed {
    description: "This returns '1' if order is completed (financial_status in ('paid', 'partially_paid', 'partially_refunded')), '0' if no"
    type: number
    sql: ${TABLE}.is_completed ;;
    group_label: "Order Attributes"
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
    group_label: "Order Attributes"
  }

#------------------------------------------ CUSTOMER ATTRIBUTES

  dimension: customer_age_days {
    description: "This returns the number of days since the user's first completed order"
    type: number
    sql: ${TABLE}.customer_age_days ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_30_day_completed_orders {
    description: "This is a user's count of completed orders in the first 30 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_30_day_completed_orders ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_30_day_revenue {
    description: "This is a user's sum of total amount in the first 30 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_30_day_revenue ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_60_day_completed_orders {
    description: "This is a user's count of completed orders in the first 60 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_60_day_completed_orders ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_60_day_revenue {
    description: "This is a user's sum of total amount in the first 60 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_60_day_revenue ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_90_day_completed_orders {
    description: "This is a user's count of completed orders in the first 90 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_90_day_completed_orders ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_90_day_revenue {
    description: "This is a user's sum of total amount in the first 90 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_90_day_revenue ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_type {
    description: "This classifies a customer based on their purchasing ('single_purchaser', 'repeat_purchaser', 'non_purchaser')"
    type: string
    sql: ${TABLE}.customer_type ;;
    group_label: "Customer Attributes"
  }

  dimension: days_from_first_completed_order {
    description: "This returns the number of days between the order placed and a customer's first completed order date"
    type: number
    sql: ${TABLE}.days_from_first_completed_order ;;
    group_label: "Customer Attributes"
  }

  dimension: days_since_previous_completed_order {
    description: "This returns the number of days between the order placed and a customer's last completed order"
    type: number
    sql: ${TABLE}.days_since_previous_completed_order ;;
    group_label: "Customer Attributes"
  }

  dimension: weeks_from_first_completed_order {
    description: "This is a count of weeks since a customer's first completed order"
    type: number
    sql: ${TABLE}.weeks_from_first_completed_order ;;
  }

  dimension: lifetime_completed_orders {
    description: "This is a user's count of completed orders all time"
    type: number
    sql: ${TABLE}.lifetime_completed_orders ;;
    group_label: "Customer Attributes"
  }

  dimension: lifetime_completed_revenue {
    description: "This is a user's total sum of completed revenue all time"
    type: number
    sql: ${TABLE}.lifetime_completed_revenue ;;
    group_label: "Customer Attributes"
  }

  dimension: lifetime_placed_orders {
    description: "This is a user's count of orders all time"
    type: number
    sql: ${TABLE}.lifetime_placed_orders ;;
    group_label: "Customer Attributes"
  }

  dimension: lifetime_revenue {
    description: "This is a user's total sum of revenue all time"
    type: number
    sql: ${TABLE}.lifetime_revenue ;;
    group_label: "Customer Attributes"
  }

  dimension: months_from_first_completed_order {
    description: "This is a count of months since a customer's first completed order"
    type: number
    sql: ${TABLE}.months_from_first_completed_order ;;
    group_label: "Customer Attributes"
  }

  dimension: new_vs_repeat {
    description: "This returns 'new' for the customer's first placed order and 'repeat' for subsequent orders"
    type: string
    sql: ${TABLE}.new_vs_repeat ;;
    group_label: "Customer Attributes"
  }

#------------------------------------------ DIMENSIONS

  dimension: billing_address_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billing_address_id ;;
  }

  dimension: shipping_address_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shipping_address_id ;;
  }

  dimension: location_id {
    hidden: yes
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: total {
    description: "This is the total price of the order"
    type: string
    sql: ${TABLE}.total ;;
  }

#------------------------------------------ MEASURES

  measure: orders_count {
    description: "This counts all orders"
    type: count
    group_label: "Counts"
  }

  measure: distinct_buyers {
    description: "This counts distinct buyers"
    type: count_distinct
    sql: ${customer_id} ;;
    group_label: "Counts"
  }

  measure: total_revenue {
    description: "This sums total to get total revenue"
    type: sum
    value_format_name: usd_0
    sql: ${total} ;;
    group_label: "Totals"
  }

  measure: average_order_value {
    description: "This sums net revenue and divides by the number of orders to get the average order value"
    type: average
    value_format_name: usd_0
    sql: ${total} ;;
    group_label: "Averages"
  }

  measure: average_days_between_orders{
    description: "This sums days since a customer previous completed order date and divides by total orders to get the average"
    type: average
    sql: ${days_since_previous_completed_order} ;;
    group_label: "Averages"
  }
}
