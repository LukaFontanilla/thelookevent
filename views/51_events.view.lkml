view: events {
  sql_table_name: looker-private-demo.ecomm.events ;;

  dimension: event_id {
    label: "Event ID"
    type: number
    primary_key: yes
    tags: ["mp_event_id"]
    sql: ${TABLE}.id ;;
  }

  dimension: session_id {
    label: "Session ID"
    type: number
    hidden: yes
    sql: ${TABLE}.session_id ;;
  }

  dimension: ip {
    label: "IP Address"
    view_label: "Visitors"
    sql: ${TABLE}.ip_address ;;
  }

  dimension: user_id {
    label: "User ID"
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: event {
    type: time
#     timeframes: [time, date, hour, time_of_day, hour_of_day, week, day_of_week_index, day_of_week]
    sql: ${TABLE}.created_at ;;
  }

  dimension: sequence_number {
    label: "Sequence Number"
    type: number
    description: "Within a given session, what order did the events take place in? 1=First, 2=Second, etc"
    sql: ${TABLE}.sequence_number ;;
  }

  dimension: is_entry_event {
    label: "Is Entry Event"
    type: yesno
    description: "Yes indicates this was the entry point / landing page of the session"
    sql: ${sequence_number} = 1 ;;
  }

  dimension: is_exit_event {
    type: yesno
    label: "UTM Source"
    sql: ${sequence_number} = ${sessions.number_of_events_in_session} ;;
    description: "Yes indicates this was the exit point / bounce page of the session"
  }

  measure: count_bounces {
    label: "Count Bounces"
    type: count
    description: "Count of events where those events were the bounce page for the session"

    filters: {
      field: is_exit_event
      value: "Yes"
    }
  }

  measure: bounce_rate {
    label: "Bounce Rate"
    type: number
    value_format_name: percent_2
    description: "Percent of events where those events were the bounce page for the session, out of all events"
    sql: ${count_bounces}*1.0 / nullif(${count}*1.0,0) ;;
  }

  dimension: full_page_url {
    label: "Full Page URL"
    sql: ${TABLE}.uri ;;
  }

  dimension: viewed_product_id {
    label: "Viewed Product ID"
    type: number
    sql: CASE WHEN ${event_type} = 'Product' THEN
          CAST(SPLIT(${full_page_url}, '/')[OFFSET(ARRAY_LENGTH(SPLIT(${full_page_url}, '/'))-1)] AS INT64)
      END
       ;;
  }

  dimension: event_type {
    label: "Event Type"
    sql: ${TABLE}.event_type ;;
    tags: ["mp_event_name"]
  }

  dimension: funnel_step {
    label: "Funnel Step"
    description: "Login -> Browse -> Add to Cart -> Checkout"
    sql: CASE
        WHEN ${event_type} IN ('Login', 'Home') THEN '(1) Land'
        WHEN ${event_type} IN ('Category', 'Brand') THEN '(2) Browse Inventory'
        WHEN ${event_type} = 'Product' THEN '(3) View Product'
        WHEN ${event_type} = 'Cart' THEN '(4) Add Item to Cart'
        WHEN ${event_type} = 'Purchase' THEN '(5) Purchase'
      END
       ;;
  }

  measure: unique_visitors {
    label: "Unique Visitors"
    type: count_distinct
    description: "Uniqueness determined by IP Address and User Login"
    view_label: "Visitors"
    sql: ${ip} ;;
    drill_fields: [visitors*]
  }

  dimension: location {
    label: "Location"
    type: location
    view_label: "Visitors"
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  dimension: approx_location {
    label: "Approximate Location"
    type: location
    view_label: "Visitors"
    sql_latitude: round(${TABLE}.latitude,1) ;;
    sql_longitude: round(${TABLE}.longitude,1) ;;
  }

  dimension: has_user_id {
    label: "Has User ID"
    type: yesno
    view_label: "Visitors"
    description: "Did the visitor sign in as a website user?"
    sql: ${users.id} > 0 ;;
  }

  dimension: browser {
    label: "Browser"
    view_label: "Visitors"
    sql: ${TABLE}.browser ;;
  }

  dimension: os {
    label: "Operating System"
    view_label: "Visitors"
    sql: ${TABLE}.os ;;
  }

  measure: count {
    label: "Count"
    type: count
    drill_fields: [simple_page_info*]
  }

  measure: sessions_count {
    label: "Sessions Count"
    type: count_distinct
    sql: ${session_id} ;;
  }

  measure: count_m {
    label: "Count (MM)"
    type: number
    hidden: yes
    sql: ${count}/1000000.0 ;;
    drill_fields: [simple_page_info*]
    value_format: "#.### \"M\""
  }

  measure: unique_visitors_m {
    label: "Unique Visitors (MM)"
    view_label: "Visitors"
    type: number
    sql: count (distinct ${ip}) / 1000000.0 ;;
    description: "Uniqueness determined by IP Address and User Login"
    value_format: "#.### \"M\""
    hidden: yes
    drill_fields: [visitors*]
  }

  measure: unique_visitors_k {
    label: "Unique Visitors (k)"
    view_label: "Visitors"
    type: number
    hidden: yes
    description: "Uniqueness determined by IP Address and User Login"
    sql: count (distinct ${ip}) / 1000.0 ;;
    value_format: "#.### \"k\""
    drill_fields: [visitors*]
  }

  set: simple_page_info {
    fields: [event_id, event_time, event_type, full_page_url, user_id, funnel_step]
  }

  set: visitors {
    fields: [ip, os, browser, user_id, count]
  }
}
