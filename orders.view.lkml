view: orders {
  sql_table_name: dbt_jthandy.orders_xf ;;

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    primary_key: yes
    hidden: yes
  }

  # ------------------------------------------------ Foreign Keys

  dimension: billing_address_id {
    type: number
    sql: ${TABLE}.billing_address_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: shipping_address_id {
    type: number
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

  # ------------------------------------------------ Other

  dimension: order_number {
    type: number
    sql: ${TABLE}.order_number ;;
  }


  # ------------------------------------------------ Measures

  measure: count {
    type: count
    drill_fields: []
  }
}
