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
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: number
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
  }

# ------------------------------------------------ Measures

  measure: count {
    type: count
    drill_fields: []
  }

}
