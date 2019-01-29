view: customers {
  sql_table_name: analytics.customers ;;

#------------------------------------------ PRIMARY KEY

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

#------------------------------------------ IDS

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

#------------------------------------------ DATES

  dimension_group: created_date {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: first_order {
    description: "This is the user's first order timestamp"
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
  }

  dimension_group: first_completed_order {
    description: "This is the user's first completed order timestamp"
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
  }

#------------------------------------------ CUSTOMER ATTRIBUTES

  dimension: first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    hidden: yes
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: phone {
    hidden: yes
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: customer_age_days {
    description: "This displays the number of days since a user's first completed order"
    type: number
    sql: ${TABLE}.customer_age_days ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_30_day_completed_orders {
    description: "This counts the number of completed orders a user had in the first 30 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_30_day_completed_orders ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_30_day_revenue {
    description: "This sums the total amount a user spent in the first 30 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_30_day_revenue ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_60_day_completed_orders {
    description: "This counts the number of completed orders a user had in the first 60 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_60_day_completed_orders ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_60_day_revenue {
    description: "This sums the total amount a user spent in the first 60 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_60_day_revenue ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_90_day_completed_orders {
    description: "This counts the number of completed orders a user had in the first 90 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_90_day_completed_orders ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_first_90_day_revenue {
    description: "This sums the total amount a user spent in the first 90 days after their first order"
    type: number
    sql: ${TABLE}.customer_first_90_day_revenue ;;
    group_label: "Customer Attributes"
  }

  dimension: customer_type {
    description: "This classifies a customer based on their purchase history ('single_purchaser', 'repeat_purchaser', 'non_purchaser'"
    type: string
    sql: ${TABLE}.customer_type ;;
    group_label: "Customer Attributes"
  }

  dimension: lifetime_completed_orders {
    description: "This is a user's count of completed orders over all time"
    type: number
    sql: ${TABLE}.lifetime_completed_orders ;;
    group_label: "Customer Attributes"
  }

  dimension: lifetime_placed_orders {
    description: "This is a user's count of all orders over all time"
    type: number
    sql: ${TABLE}.lifetime_placed_orders ;;
    group_label: "Customer Attributes"
  }

  dimension: lifetime_revenue {
    description: "This is a user's revenue sum over all time"
    type: number
    sql: ${TABLE}.lifetime_revenue ;;
    group_label: "Customer Attributes"
  }
  
#------------------------------------------ MEASURES

  measure: customers_count {
    description: "This counts how many customers have accounts"
    type: count_distinct
    sql: ${customer_id} ;;
    drill_fields: [first_name, last_name]
    group_label: "Counts"
  }

  measure: average_lifetime_revenue {
    description: "This sums lifetime revenue and divides by number of customers to get the average"
    type: average
    value_format_name: usd_0
    sql: ${lifetime_revenue} ;;
    group_label: "Averages"
  }

  measure: average_30_day_lifetime_revenue {
    description: "This sums customers' first 30-day-revenue and divides by total number of customers to get the average revenue"
    type: average
    value_format_name: usd_0
    sql: ${customer_first_30_day_revenue} ;;
    filters: {
      field: customer_age_days
      value: ">=30"
    }
    group_label: "Averages"
  }

  measure: average_60_day_lifetime_revenue {
    description: "This sums customers' first 60-day-revenue and divides by total number of customers to get the average"
    type: average
    value_format_name: usd_0
    sql: ${customer_first_60_day_revenue} ;;
    filters: {
      field: customer_age_days
      value: ">=60"
    }
    group_label: "Averages"
  }

  measure: average_90_day_lifetime_revenue {
    description: "This sums customers' first 90-day-revenue and divides by total number of customers"
    type: average
    value_format_name: usd_0
    sql: ${customer_first_90_day_revenue} ;;
    filters: {
      field: customer_age_days
      value: ">=90"
    }
    group_label: "Averages"
  }

  measure: average_lifetime_completed_orders {
    description: "This sums lifetime completed orders and divides by total number of customers to get the average"
    type: average
    value_format_name: decimal_2
    sql: ${lifetime_completed_orders} ;;
    group_label: "Averages"
  }

  measure: average_30_day_lifetime_completed_orders {
    description: "This sums the total number of completed orders a customer has made in their first 30 days and divides by total number of customers to get the average"
    type: average
    value_format_name: decimal_2
    sql: ${customer_first_30_day_completed_orders} ;;
    filters: {
      field: customer_age_days
      value: ">=30"
    }
    group_label: "Averages"
  }

  measure: average_60_day_lifetime_completed_orders {
    description: "This sums the total number of completed orders a customer has made in their first 60 days and divides by total number of customers to get the average"
    type: average
    value_format_name: decimal_2
    sql: ${customer_first_60_day_completed_orders} ;;
    filters: {
      field: customer_age_days
      value: ">=60"
    }
    group_label: "Averages"
  }

  measure: average_90_day_lifetime_completed_orders {
    description: "This sums the total number of completed orders a customer has made in their first 90 days and divides by total number of customers to get the average"
    type: average
    value_format_name: decimal_2
    sql: ${customer_first_90_day_completed_orders} ;;
    filters: {
      field: customer_age_days
      value: ">=90"
    }
    group_label: "Averages"
  }
}
