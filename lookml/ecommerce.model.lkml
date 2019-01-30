connection: " "

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

#------------------------------------------ ECOMMERCE

explore: customers{}

explore: orders {

  join: order_items {
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: customers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
  }
}
