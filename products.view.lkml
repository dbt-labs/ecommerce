view: products {
  sql_table_name: dbt_elouie.products ;;

  dimension: product_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
    primary_key: yes
    hidden: yes
  }

# ------------------------------------------------ Product Info

  dimension: product_title {
    type: string
    sql: ${TABLE}.product_title ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }
# ------------------------------------------------ Dates
  dimension: created_at {
    type: date
    sql: ${TABLE}.created_at ;;
  }

  dimension: deleted_at {
    type: date
    sql: ${TABLE}.deleted_at ;;
  }

# ------------------------------------------------ Measures

  measure: count {
    type: count
    drill_fields: []
  }

}
