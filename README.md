# Fishtown Analytics Ecommerce Package

## Dependencies

This package requires that you have [dbt-utils](https://github.com/fishtown-analytics/dbt-utils) listed in your project's packages.yml file

## Required Columns

Structure your orders model that feeds into the ecommerce package such that it has the following columns and column names:
- created at timestamp: **created_at**
- timestamp that is ***not*** null if the order has been cancelled: **cancelled_at**
- cost of an order, used for revenue calculations: **total_price**
- email (or other unique id) associated with order: **email**
- binary value for whether the order should be included for completed orders and revenue: **is_completed**

## Note about casing

Release 0.1.3 has uppercase model names and refs to support Snowflake's automatic upper-casing of model names. This branch, however, has lowercase model names and refs and is intended to be used with projects that are using dbt version 0.10.1 and up, have lowercased model names, and are configured to have quoting off. Read more about dbt casing  [here](https://docs.getdbt.com/v0.10/docs/configuring-quoting)


---
- [What is dbt](https://dbt.readme.io/docs/overview)?
- Read the [dbt viewpoint](https://dbt.readme.io/docs/viewpoint)
- [Installation](https://dbt.readme.io/docs/installation)
- Join the [chat](http://ac-slackin.herokuapp.com/) on Slack for live questions and support.Â
---
