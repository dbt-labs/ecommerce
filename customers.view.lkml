view: customers {
  sql_table_name: dbt_elouie.customers ;;

  dimension: customer_id {
    type: number
    sql: ${TABLE}.address_id ;;
    primary_key: yes
    hidden: yes
  }

# ------------------------------------------------ Customer Info
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

# ------------------------------------------------ Dates

  dimension: created_at {
    type: date
    sql: ${TABLE}.created_at ;;
  }

  dimension: updated_at {
    type: date
    sql: ${TABLE}.updated_at ;;
  }

# ------------------------------------------------ Measures

  measure: count {
    type: count
    drill_fields: []
  }

}
