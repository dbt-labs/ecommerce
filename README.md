# Fishtown Analytics Ecommerce Package

## Dependencies

This package requires that you have [dbt-utils](https://github.com/fishtown-analytics/dbt-utils) listed in your project's packages.yml file

## Required Columns

Structure your orders model that feeds into the ecommerce package such that it has the following columns and column names:
- created at timestamp: **created_at**
- column that is ***not*** null if the order has been cancelled: **cancelled_at**
- email associated with order: **email**
- column with binary value for whether the order should be included for completed orders and revenue: **is_completed**

---
- [What is dbt](https://dbt.readme.io/docs/overview)?
- Read the [dbt viewpoint](https://dbt.readme.io/docs/viewpoint)
- [Installation](https://dbt.readme.io/docs/installation)
- Join the [chat](http://ac-slackin.herokuapp.com/) on Slack for live questions and support.Â
---
