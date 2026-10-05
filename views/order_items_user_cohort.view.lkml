view: order_items_user_cohort {
  filter: time_range {
    type: date
    description: "Use this filter to restrict the time range of order items included in the cohort analysis."
  }

  derived_table: {
    sql:
      WITH user_first_purchase AS (
        SELECT
          user_id,
          MIN(created_at) AS first_purchase_at
        FROM `looker-private-demo.thelook.order_items`
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
      FROM `looker-private-demo.thelook.order_items` oi
      JOIN user_first_purchase ufp ON oi.user_id = ufp.user_id
      WHERE {% condition time_range %} oi.created_at {% endcondition %}
    ;;
  }

  dimension: order_item_id {
    primary_key: yes
    type: float
    description: "Unique identifier for the order item."
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: order_id {
    type: number
    description: "Unique identifier for the order."
    sql: ${TABLE}.order_id ;;
  }

  dimension: user_id {
    type: number
    description: "Unique identifier for the user who placed the order."
    sql: ${TABLE}.user_id ;;
  }

  dimension: inventory_item_id {
    type: number
    description: "Unique identifier for the inventory item."
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: status {
    type: string
    description: "Current status of the order item."
    sql: ${TABLE}.status ;;
  }

  dimension: sale_price {
    type: number
    value_format_name: usd
    description: "The price at which the item was sold."
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    description: "Date and time when the order item was created."
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: first_purchase {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    description: "Date and time of the user's very first purchase."
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
    description: "Yes if the order item was returned."
    sql: ${TABLE}.returned_at IS NOT NULL ;;
  }

  dimension: days_since_first_purchase {
    type: number
    description: "Number of days between the user's first purchase and this order item."
    sql: DATE_DIFF(DATE(${created_date}), DATE(${first_purchase_date}), DAY) ;;
  }

  dimension: weeks_since_first_purchase {
    type: number
    description: "Number of weeks between the user's first purchase and this order item."
    sql: DATE_DIFF(DATE(${created_date}), DATE(${first_purchase_date}), WEEK) ;;
  }

  dimension: months_since_first_purchase {
    description: "Number of months between the user's first purchase and this order item"
    type: number
    sql: DATE_DIFF(DATE(${created_date}), DATE(${first_purchase_date}), MONTH) ;;
  }

  dimension: quarters_since_first_purchase {
    type: number
    description: "Number of quarters between the user's first purchase and this order item."
    sql: DATE_DIFF(DATE(${created_date}), DATE(${first_purchase_date}), QUARTER) ;;
  }

  measure: total_sale_price {
    label: "Total Sale Price"
    type: sum
    value_format_name: usd
    description: "Total revenue from all items sold."
    sql: ${sale_price} ;;
  }

  measure: percent_of_overall_sale_price {
    label: "Percent of Overall Sale Price"
    description: "Percentage of total sale price across all groups in the query"
    type: percent_of_total
    sql: ${total_sale_price} ;;
  }

  measure: average_sale_price {
    label: "Average Sale Price"
    type: average
    value_format_name: usd
    description: "Average price for each item sold."
    sql: ${sale_price} ;;
  }

  measure: average_revenue_per_user {
    label: "Average Revenue per User"
    type: number
    value_format_name: usd
    description: "Total sale price divided by the total number of users."
    sql: ${total_sale_price} / NULLIF(${user_count}, 0) ;;
  }

  measure: average_order_value {
    label: "Average Order Value"
    type: number
    value_format_name: usd
    description: "Total sale price divided by the total number of orders."
    sql: ${total_sale_price} / NULLIF(${order_count}, 0) ;;
  }

  measure: order_count {
    label: "Order Count"
    type: count_distinct
    description: "Total number of unique orders."
    sql: ${order_id} ;;
  }

  measure: user_count {
    label: "User Count"
    type: count_distinct
    description: "Total number of unique users."
    sql: ${user_id} ;;
  }
}