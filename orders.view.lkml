view: orders {
  sql_table_name: analytics.orders ;;

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    primary_key: yes
    hidden: yes
  }

  # ------------------------------------------------ Foreign Keys

  dimension: billing_address_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billing_address_id ;;
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: shipping_address_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shipping_address_id ;;
  }

  # ------------------------------------------------ Dates

  dimension_group: created {
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

  dimension_group: first_order {
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

  # ------------------------------------------------ Other

  dimension: order_number {
    type: number
    sql: ${TABLE}.order_number ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: new_vs_repeat {
    type: string
    sql: ${TABLE}.new_or_repeat ;;
  }

  dimension: months_from_start {
    type: number
    sql: ${TABLE}.months_from_start ;;
  }

  # ------------------------------------------------ Measures

  measure: count {
    type: count
    drill_fields: []
  }

  measure: customers_count {
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${total} ;;
    value_format_name: usd
  }

  measure: avg_order_value {
    type: average
    sql: ${TABLE}.total ;;
    value_format_name: usd
  }
}
