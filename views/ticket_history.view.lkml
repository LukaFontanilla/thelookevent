explore: ticket_history {}
view: ticket_history {
  sql_table_name: `looker-private-demo.zendesk.ticket_history` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  measure: total_tix {
    type: count_distinct
    sql: ${id} ;;
  }
  dimension: new_value {
    type: string
    sql: ${TABLE}.new_value ;;
  }
  dimension: property {
    type: string
    sql: ${TABLE}.property ;;
  }
  dimension: ticket_id {
    type: string
    sql: ${TABLE}.ticket_id ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.timestamp ;;
  }
  dimension: updater_id {
    type: string
    sql: ${TABLE}.updater_id ;;
  }
  dimension: via {
    type: string
    sql: ${TABLE}.via ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
