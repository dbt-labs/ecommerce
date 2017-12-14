connection: "shopify_test"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: orders {}

explore: addresses {}

explore: order_items {}

explore: products {}

explore: customers {}
