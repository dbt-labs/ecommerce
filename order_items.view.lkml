view: order_items {
  sql_table_name: dbt_elouie.order_items ;;

  dimension: order_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
    primary_key: yes
    hidden: yes
  }
# ------------------------------------------------ Foreign Keys
  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }

# ------------------------------------------------ Order Info
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    value_format_name: usd
  }

  dimension: total {
    type: number
    sql: ${price} * ${quantity} ;;
  }

# ------------------------------------------------ Measures

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_revenue {
    type: sum
    sql: ${total} ;;
    value_format_name: usd_0
  }

}
