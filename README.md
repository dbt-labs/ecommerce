# Fishtown Analytics Ecommerce Package

## Dependencies

This package requires that you have [dbt-utils](https://github.com/fishtown-analytics/dbt-utils) listed in your project's packages.yml file

## Required Columns

Structure your orders model that feeds into the ecommerce package such that it has the following columns and column names:
- entry created timestamp: **created_at**
- email associated with order: **email**
- binary value for whether an order should be counted in paid orders and revenue: **is_completed**

---
- [What is dbt](https://dbt.readme.io/docs/overview)?
- Read the [dbt viewpoint](https://dbt.readme.io/docs/viewpoint)
- [Installation](https://dbt.readme.io/docs/installation)
- Join the [chat](http://ac-slackin.herokuapp.com/) on Slack for live questions and support.Â
---
