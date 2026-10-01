view: appearances {
  sql_table_name: `paggie-svc-project.mlb_race_to_october.appearances` ;;

  dimension: games_batting {
    type: number
    description: "Games in which the player batted."
    sql: ${TABLE}.games_batting ;;
  }
  dimension: games_catcher {
    type: number
    description: "Games appeared as a catcher."
    sql: ${TABLE}.games_catcher ;;
  }
  dimension: games_center_field {
    type: number
    description: "Games appeared in center field."
    sql: ${TABLE}.games_center_field ;;
  }
  dimension: games_defense {
    type: number
    description: "Games played defensively (any position including DH)."
    sql: ${TABLE}.games_defense ;;
  }
  dimension: games_designated_hitter {
    type: number
    description: "Games as DH. The DH was introduced in the AL in 1973 and adopted by the NL in 2022."
    sql: ${TABLE}.games_designated_hitter ;;
  }
  dimension: games_first_base {
    type: number
    description: "Games appeared at first base."
    sql: ${TABLE}.games_first_base ;;
  }
  dimension: games_left_field {
    type: number
    description: "Games appeared in left field."
    sql: ${TABLE}.games_left_field ;;
  }
  dimension: games_outfield {
    type: number
    description: "Total outfield games (G_OF). Equals games_left_field + games_center_field + games_right_field. Useful for queries that don't care about the specific outfield position."
    sql: ${TABLE}.games_outfield ;;
  }
  dimension: games_pinch_hitter {
    type: number
    description: "Games as a pinch hitter."
    sql: ${TABLE}.games_pinch_hitter ;;
  }
  dimension: games_pinch_runner {
    type: number
    description: "Games as a pinch runner."
    sql: ${TABLE}.games_pinch_runner ;;
  }
  dimension: games_pitcher {
    type: number
    description: "Games appeared as a pitcher."
    sql: ${TABLE}.games_pitcher ;;
  }
  dimension: games_right_field {
    type: number
    description: "Games appeared in right field."
    sql: ${TABLE}.games_right_field ;;
  }
  dimension: games_second_base {
    type: number
    description: "Games appeared at second base."
    sql: ${TABLE}.games_second_base ;;
  }
  dimension: games_shortstop {
    type: number
    description: "Games appeared at shortstop."
    sql: ${TABLE}.games_shortstop ;;
  }
  dimension: games_started {
    type: number
    description: "Games started in any defensive position."
    sql: ${TABLE}.games_started ;;
  }
  dimension: games_third_base {
    type: number
    description: "Games appeared at third base."
    sql: ${TABLE}.games_third_base ;;
  }
  dimension: games_total {
    type: number
    description: "Total games appeared in any capacity for this team this season (G_all in Lahman)."
    sql: ${TABLE}.games_total ;;
  }
  dimension: lg_id {
    type: string
    description: "League ID."
    sql: ${TABLE}.lgID ;;
  }
  dimension: player_id {
    type: string
    description: "Lahman's universal player identifier."
    sql: ${TABLE}.playerID ;;
  }
  dimension: team_id {
    type: string
    description: "Team for this row."
    sql: ${TABLE}.teamID ;;
  }
  dimension: year_id {
    type: number
    description: "Season year (4-digit)."
    sql: ${TABLE}.yearID ;;
  }
  measure: count {
    type: count
  }
}
