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
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: variant_id {
    hidden: yes
    type: string
    sql: ${TABLE}.variant_id ;;
  }

  dimension: product_id {
    hidden: yes
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: email {
    description: "This is the customer's email"
    type: string
    sql: ${TABLE}.email ;;
  }

#------------------------------------------ PRODUCT ATTRIBUTES

  dimension: product_sku {
    description: "This is the unique identifier for every product"
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension: product_exists {
    description: "This displays 'true' if a product exists in Shopify, 'false' if it does not"
    type: yesno
    sql: ${TABLE}.product_exists ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_title {
    description: "This is the name of the product purchased"
    type: string
    sql: ${TABLE}.product_title ;;
  }

  dimension: variant_title {
    hidden: yes
    type: string
    sql: ${TABLE}.variant_title ;;
  }

  dimension: pre_tax_price {
    description: "This is the price of an item before taxes"
    type: string
    sql: ${TABLE}.pre_tax_price ;;
  }

  dimension: total_price {
    description: "This is the price of each item after taxes are applied"
    type: number
    sql: ${TABLE}.price ;;
  }

#------------------------------------------ DIMENSIONS

  dimension: tax_amount {
    description: "This is the total amount of taxes applied to the order item"
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: financial_status {
    description: "This is the financial status of a customer's order ('paid' or 'refunded')"
    type: string
    sql: ${TABLE}.financial_status ;;
  }

  dimension: fulfillment_quantity {
    hidden: yes
    type: string
    sql: ${TABLE}.fulfillment_quantity ;;
  }

  dimension: fulfillment_service {
    type: string
    sql: ${TABLE}.fulfillment_service ;;
  }

  dimension: fulfillment_status {
    hidden: yes
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: gift_card {
    description: "This displays true/false depending on if a customer uses a gift card"
    type: yesno
    sql: ${TABLE}.gift_card ;;
  }

  dimension: grams {
    hidden: yes
    type: string
    sql: ${TABLE}.grams ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: quantity {
    description: "This is the count of the SKU purchased on the line item"
    type: string
    sql: ${TABLE}.quantity ;;
  }

  dimension: requires_shipping {
    description: "This returns true/false depending on if an order requires shipping"
    type: yesno
    sql: ${TABLE}.requires_shipping ;;
  }

  dimension: taxable {
    description: "This returns true/false depending on if an item is taxable"
    type: yesno
    sql: ${TABLE}.taxable ;;
  }

  dimension: total_discount {
    description: "This is the total discount amount for the item"
    type: string
    sql: ${TABLE}.total_discount ;;
  }

  dimension: variant_inventory_management {
    hidden: yes
    type: string
    sql: ${TABLE}.variant_inventory_management ;;
  }

  dimension: vendor {
    description: "This is the vendor's name"
    type: string
    sql: ${TABLE}.vendor ;;
  }

  dimension: revenue {
    type: number
    sql: ${total_price} * ${quantity} ;;
  }

#------------------------------------------ MEASURES

  measure: items_sold {
    description: "This sums the quantity"
    type: sum
    sql: ${quantity} ;;
    drill_fields: [product_name]
  }

  measure: total_revenue {
    description: "This sums item total revenue"
    type: sum
    value_format_name: usd_0
    sql: ${revenue} ;;
  }
}
