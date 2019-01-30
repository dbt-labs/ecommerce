view: order_items {
  sql_table_name: analytics.order_items ;;


#------------------------------------------ PRIMARY KEY

  dimension: order_item_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.order_item_id ;;
  }

#------------------------------------------ IDS

  dimension: order_id {
    description: "This is the order ID"
    type: number
    sql: ${TABLE}.order_id ;;
  }
  
  dimension: product_id {
    hidden: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

#------------------------------------------ ORDER ATTRIBUTES

  dimension: sku {
    description: "This is the unique identifier for every product"
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    value_format_name: usd_0
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total;;
  }
  
  dimension: quantity {
    description: "This is the count of the SKU purchased on the line item"
    type: string
    sql: ${TABLE}.quantity ;;
  }

#------------------------------------------ MEASURES

  measure: items_sold {
    description: "This sums the quantity"
    type: sum
    sql: ${quantity} ;;
  }

  measure: total_revenue {
    description: "This sums item total revenue"
    type: sum
    sql: ${total} * ${quantity} ;;
    value_format_name: usd_0
  }
}
