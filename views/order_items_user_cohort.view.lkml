view: order_items_user_cohort {
  derived_table: {
    sql:
      WITH user_first_purchase AS (
        SELECT
          user_id,
          MIN(created_at) AS first_purchase_at
        FROM `looker-private-demo.ecomm.order_items`
        GROUP BY 1
      )
      SELECT
        oi.id AS order_item_id,
        oi.order_id,
        oi.user_id,
        oi.inventory_item_id,
        oi.status,
        oi.created_at,
        oi.shipped_at,
        oi.delivered_at,
        oi.returned_at,
        oi.sale_price,
        ufp.first_purchase_at,
        DENSE_RANK() OVER (PARTITION BY oi.user_id ORDER BY oi.created_at) AS user_order_sequence_number,
        DATE_DIFF(DATE(oi.created_at), DATE(LAG(oi.created_at) OVER (PARTITION BY oi.user_id ORDER BY oi.created_at)), DAY) AS days_since_previous_order
      FROM `looker-private-demo.ecomm.order_items` oi
      JOIN user_first_purchase ufp ON oi.user_id = ufp.user_id
    ;;
  }

  dimension: order_item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sale_price {
    type: number
    value_format_name: usd
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: first_purchase {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_purchase_at ;;
  }

  dimension: user_order_sequence_number {
    type: number
    description: "1 for the user's first order, 2 for the second, etc."
    sql: ${TABLE}.user_order_sequence_number ;;
  }

  dimension: days_since_previous_order {
    type: number
    description: "Days elapsed since this user's previous order"
    sql: ${TABLE}.days_since_previous_order ;;
  }

  dimension: is_first_purchase {
    type: yesno
    description: "Yes if this order item was part of the user's very first purchase"
    sql: ${created_raw} = ${first_purchase_raw} ;;
  }

  dimension: is_returned {
    type: yesno
    sql: ${TABLE}.returned_at IS NOT NULL ;;
  }

  dimension: days_since_first_purchase {
    type: number
    sql: DATE_DIFF(DATE(${created_date}), DATE(${first_purchase_date}), DAY) ;;
  }

  dimension: weeks_since_first_purchase {
    type: number
    sql: DATE_DIFF(DATE(${created_date}), DATE(${first_purchase_date}), WEEK) ;;
  }

  dimension: months_since_first_purchase {
    description: "Number of months between the user's first purchase and this order item"
    type: number
    sql: DATE_DIFF(DATE(${created_date}), DATE(${first_purchase_date}), MONTH) ;;
  }

  dimension: quarters_since_first_purchase {
    type: number
    sql: DATE_DIFF(DATE(${created_date}), DATE(${first_purchase_date}), QUARTER) ;;
  }

  measure: total_sale_price {
    type: sum
    value_format_name: usd
    sql: ${sale_price} ;;
  }

  measure: percent_of_overall_sale_price {
    description: "Percentage of total sale price across all groups in the query"
    type: percent_of_total
    sql: ${total_sale_price} ;;
  }

  measure: average_sale_price {
    type: average
    value_format_name: usd
    sql: ${sale_price} ;;
  }

  measure: average_revenue_per_user {
    type: number
    value_format_name: usd
    sql: ${total_sale_price} / NULLIF(${user_count}, 0) ;;
  }

  measure: average_order_value {
    type: number
    value_format_name: usd
    sql: ${total_sale_price} / NULLIF(${order_count}, 0) ;;
  }

  measure: order_count {
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: user_count {
    type: count_distinct
    sql: ${user_id} ;;
  }
}