view: view_xyz {
  sql_table_name: looker-private-demo.ecomm.events ;;

  dimension: event_id {
    label: "Event ID"
    type: number
    primary_key: yes
    tags: ["mp_event_id"]
    sql: ${TABLE}.id ;;
  }
  }
