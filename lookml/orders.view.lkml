view: orders {
  sql_table_name: analytics.orders_xf ;;

#------------------------------------------ PRIMARY KEY

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

#------------------------------------------ IDS

  dimension: app_id {
    hidden: yes
    type: string
    sql: ${TABLE}.app_id ;;
  }

  dimension: token {
    hidden: yes
    type: string
    sql: ${TABLE}.token ;;
  }

  dimension: user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: customer_id {
    description: "This is the user's customer ID"
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: source_name_id {
    hidden: yes
    type: string
    sql: ${TABLE}.source_name_id ;;
  }

  dimension: name_id {
    hidden: yes
    type: string
    sql: ${TABLE}.name_id ;;
  }

  dimension: email {
    description: "This is the user's email address"
    type: string
    sql: ${TABLE}.email ;;
    group_label: "Customer Attributes"
  }

  dimension: last_order_id {
    hidden: yes
    type: string
    sql: ${TABLE}.last_order_id ;;
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

  dimension_group: closed {
    description: "This is the timestamp of when an order was closed"
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
    sql: ${TABLE}.CLOSED_AT ;;
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

  dimension_group: cancelled {
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
    sql: ${TABLE}.cancelled_at ;;
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

  dimension_group: previous_completed_order_calc {
    hidden: yes
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
    sql: ${TABLE}.previous_completed_order_calc ;;
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

  dimension: is_cancelled {
    description: "This returns true/false depending on if the order has been cancelled"
    type: yesno
    sql: ${TABLE}.is_cancelled ;;
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

  dimension: total_shipping_cost {
    description: "This is the total shipping cost for an order"
    type: number
    sql: ${TABLE}.total_shipping_cost ;;
    group_label: "Shipping"
  }

  dimension: shipping_currency_code {
    type: string
    sql: ${TABLE}.shipping_currency_code ;;
    group_label: "Shipping"
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.shipping_city ;;
    group_label: "Shipping"
  }

  dimension: shipping_province {
    type: string
    sql: ${TABLE}.shipping_province ;;
    group_label: "Shipping"
  }

  dimension: shipping_province_code {
    type: string
    sql: ${TABLE}.shipping_province_code ;;
    group_label: "Shipping"
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shipping_country ;;
    group_label: "Shipping"
  }

  dimension: shipping_country_code {
    type: string
    sql: ${TABLE}.shipping_country_code ;;
    group_label: "Shipping"
  }

  dimension: shipping_zip_code {
    type: string
    sql: ${TABLE}.shipping_zip_code ;;
    group_label: "Shipping"
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.billing_city ;;
    group_label: "Billing"
  }

  dimension: billing_province {
    type: string
    sql: ${TABLE}.billing_province ;;
    group_label: "Billing"
  }

  dimension: billing_province_code {
    type: string
    sql: ${TABLE}.billing_province_code ;;
    group_label: "Billing"
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
    group_label: "Billing"
  }

  dimension: billing_country_code {
    type: string
    sql: ${TABLE}.billing_country_code ;;
    group_label: "Billing"
  }

  dimension: billing_zip_code {
    type: string
    sql: ${TABLE}.billing_zip_code ;;
    group_label: "Billing"
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

  dimension: billing_address {
    hidden: yes
    type: string
    sql: ${TABLE}.billing_address ;;
  }

  dimension: buyer_accepts_marketing {
    hidden: yes
    type: yesno
    sql: ${TABLE}.buyer_accepts_marketing ;;
  }

  dimension: confirmed {
    hidden: yes
    type: yesno
    sql: ${TABLE}.confirmed ;;
  }

  dimension: contact_email {
    hidden: yes
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}."CURRENCY" ;;
  }
  
  dimension: financial_status {
    description: "This is the financial status of a customer's order ('paid', 'refunded', or 'partially_refunded')"
    type: string
    sql: ${TABLE}.financial_status ;;
  }

  dimension: fulfillment_status {
    hidden: yes
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: gateway {
    description: "This returns what payment was used to pay for the order"
    type: string
    sql: ${TABLE}.gateway ;;
    group_label: "Order Attributes"
  }

  dimension: location_id {
    hidden: yes
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: note {
    hidden: yes
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: note_attributes {
    hidden: yes
    type: string
    sql: ${TABLE}.note_attributes ;;
  }

  dimension: number {
    hidden: yes
    type: string
    sql: ${TABLE}.number ;;
  }

  dimension: payment_gateway_names {
    hidden: yes
    type: string
    sql: ${TABLE}.payment_gateway_names ;;
  }

  dimension: phone_number {
    hidden: yes
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: processing_method {
    description: "This returns what method was used to process the order"
    type: string
    sql: ${TABLE}.processing_method ;;
    group_label: "Order Attributes"
  }
  
  dimension: shipping_address {
    hidden: yes
    type: string
    sql: ${TABLE}.shipping_address ;;
  }

  dimension: subtotal_price {
    description: "This is the subtotal price of the order"
    type: string
    sql: ${TABLE}.subtotal_price ;;
  }

  dimension: tags {
    hidden: yes
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: taxes_included {
    description: "This returns true/false depending on if taxes were included in the order"
    type: yesno
    sql: ${TABLE}.taxes_included ;;
  }

  dimension: test {
    hidden: yes
    type: yesno
    sql: ${TABLE}.test ;;
  }

  dimension: total_discounts {
    description: "This is the total discount amount for the order"
    type: number
    sql: ${TABLE}.total_discounts ;;
  }

  dimension: discount_code{
    description: "This is the name of the coupon a customer used with their order"
    type: string
    sql: ${TABLE}.discount_code ;;
  }

  dimension: total_line_items_price {
    description: "This is the total price of an order before taxes, discounts and shipping are applied"
    type: string
    sql: ${TABLE}.total_line_items_price ;;
  }

  dimension: total_price {
    description: "This is the total price of the order after taxes, discounts and shipping are applied"
    type: string
    sql: ${TABLE}.total_price ;;
  }

  dimension: total_price_usd {
    description: "This is the total price of the order in USD"
    type: string
    sql: ${TABLE}.total_price_usd ;;
  }

  dimension: total_tax {
    description: "This is the total amount of taxes applied to the order"
    type: string
    sql: ${TABLE}.total_tax ;;
  }

  dimension: total_tip_received {
    description: "This is the total amount of tip received on the order"
    type: string
    sql: ${TABLE}.total_tip_received ;;
  }

  dimension: total_weight {
    hidden: yes
    type: string
    sql: ${TABLE}.total_weight ;;
  }

  dimension: cancel_reason {
    hidden: yes
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension: browser_ip {
    hidden: yes
    type: string
    sql: ${TABLE}.browser_ip ;;
  }

  dimension: landing_site {
    hidden: yes
    type: string
    sql: ${TABLE}.landing_site ;;
  }

  dimension: landing_site_ref {
    hidden: yes
    type: string
    sql: ${TABLE}.landing_site_ref ;;
  }

  dimension: referring_site {
    hidden: yes
    type: string
    sql: ${TABLE}.referring_site ;;
  }
#------------------------------------------ MEASURES

  measure: orders_count {
    description: "This counts all orders"
    type: count
    drill_fields: [orders_drill_fields*, total_line_items_price, total_discounts, net_revenue, total_shipping_cost, total_tax, total_sales]
    group_label: "Counts"
  }

  measure: distinct_buyers {
    description: "This counts distinct buyers"
    type: count_distinct
    sql: ${email} ;;
    group_label: "Counts"
  }

  measure: total_revenue {
    description: "This sums total price usd to get total revenue"
    type: sum
    value_format_name: usd_0
    sql: ${total_price_usd} ;;
    group_label: "Totals"
    drill_fields: [orders_drill_fields*, total_gross_revenue]
  }

  measure: average_order_value {
    description: "This sums net revenue and divides by the number of orders to get the average order value"
    type: average
    value_format_name: usd_0
    sql: ${net_revenue} ;;
    group_label: "Averages"
    drill_fields: [orders_drill_fields*, average_order_value]
  }

  measure: average_days_between_orders{
    description: "This sums days since a customer previous completed order date and divides by total orders to get the average"
    type: average
    sql: ${days_since_previous_completed_order} ;;
    group_label: "Averages"
    drill_fields: [orders_drill_fields*, average_days_between_orders]
  }

  set: orders_drill_fields {
    fields: [created_at_date, order_id, order_number]
  }

}
