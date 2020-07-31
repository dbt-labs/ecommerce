# [Deprecated] Fishtown Analytics Ecommerce Package

> ⚠️ **WARNING!** This package is no longer maintained. We do not recommend adding it to your dbt project. This code remains public to prevent breaking changes to any existing dbt projects that use this package.

Requires dbt >= 0.12.2

## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/fishtown-analytics/snowplow/latest/) for
the latest installation instructions, or [read the docs](https://docs.getdbt.com/docs/package-management)
for more information on installing packages.

## Required Columns

Structure your orders model that feeds into the ecommerce package such that it has the following columns and column names:
- created at timestamp: **created_at**
- timestamp that is ***not*** null if the order has been cancelled: **cancelled_at**
- cost of an order, used for revenue calculations: **total_price**
- email (or other unique id) associated with order: **email**
- binary value for whether the order should be included for completed orders and revenue: **is_completed**

## Configuration ###

The [variables](https://docs.getdbt.com/docs/using-variables) needed to configure this package are as follows:

| variable | information | required |
|----------|-------------|:--------:|
|customer_aggregate_on| Used to partition orders by to create common metrics (like time between orders).|Yes|
|customer_join_on| Used to join customers and orders tables. This may be different that the field to aggregate depending on the structure of the data. |Yes|
|days|This accepts a list of days to calculate customers_first_x_day_revenue and order values. This will return the revenue or number of orders that user places in their first x days. |Yes|


An example `dbt_project.yml` configuration:

```yml
# dbt_project.yml

...

models:
    fishtown_analytics_ecommerce:
        vars:
          addresses_table: "{{ref('stg_addresses')}}"
          customers_table: "{{ref('stg_customers')}}"
          order_items_table: "{{ref('stg_order_items')}}"
          orders_table: "{{ref('stg_orders')}}"
          products_table: "{{ref('stg_products')}}"
          customer_aggregate_on: customer_id
          customer_join_on: customer_id
          days: ['30', '60', '90', '365']
```

---
- [What is dbt](https://dbt.readme.io/docs/overview)?
- Read the [dbt viewpoint](https://dbt.readme.io/docs/viewpoint)
- [Installation](https://dbt.readme.io/docs/installation)
- Join the [chat](http://ac-slackin.herokuapp.com/) on Slack for live questions and support.
---
