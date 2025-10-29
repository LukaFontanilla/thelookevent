view: channels {
  sql_table_name: `looker-private-demo.retail.channels` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
