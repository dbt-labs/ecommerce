view: addresses {
  sql_table_name: analytics.addresses ;;

  dimension: address_id {
    type: number
    sql: ${TABLE}.address_id ;;
    primary_key: yes
    hidden: yes
  }

  # ------------------------------------------------ Geography
  dimension: address_1 {
    type: number
    sql: ${TABLE}.address_1 ;;
  }

  dimension: address_2 {
    type: number
    sql: ${TABLE}.address_2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: zip {
    type: string
    sql: ${TABLE}.zip ;;
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

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  # ------------------------------------------------ Measures

  measure: count {
    type: count
    drill_fields: []
  }
}
