connection: "shopify_test"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: orders {
  join: order_items {
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    type: left_outer
    relationship: one_to_many
  }
  join: customers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
  }
}

explore: order_items {
  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${products.product_id} ;;
  }
}

explore: customers {}
