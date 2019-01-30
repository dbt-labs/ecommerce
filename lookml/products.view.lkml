view: products {
  sql_table_name: analytics.products ;;
  
# ------------------------------------------------ PRIMARY KEY

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
    primary_key: yes
    hidden: yes
  }
  
# ------------------------------------------------ DATES

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;; }
    
  dimension_group: published {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.published_at ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: deleted_at {
    type: date
    sql: ${TABLE}.deleted_at ;;
  }

# ------------------------------------------------ PRODUCT ATTRIBUTES

  dimension: product_title {
    type: string
    sql: ${TABLE}.product_title ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }
}
