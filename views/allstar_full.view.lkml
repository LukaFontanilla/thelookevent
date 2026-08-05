view: allstar_full {
  sql_table_name: `paggie-svc-project.mlb_race_to_october.allstar_full` ;;

  dimension: game_id {
    type: string
    description: "Retrosheet-style identifier for the specific All-Star Game. Preserved in camelCase."
    sql: ${TABLE}.gameID ;;
  }
  dimension: game_num {
    type: number
    description: "Game number within the season: 1 or 2. Most years have a single ASG (game_num=1). From 1959-1962 MLB held two All-Star Games per season; those rows have game_num=2 for the second game."
    sql: ${TABLE}.game_num ;;
  }
  dimension: games_played {
    type: number
    description: "1 if the player actually appeared in the ASG, 0 or NULL if they were selected but didn't play (injury, manager's discretion, etc.). Counts of All-Star selections should NOT filter on this column; counts of All-Star appearances should."
    sql: ${TABLE}.games_played ;;
  }
  dimension: lg_id {
    type: string
    description: "League the player represented in the ASG ('AL' or 'NL')."
    sql: ${TABLE}.lgID ;;
  }
  dimension: player_id {
    type: string
    description: "Lahman's universal player identifier."
    sql: ${TABLE}.playerID ;;
  }
  dimension: starting_position {
    type: string
    description: "Position number (1-9) if the player started the game, NULL otherwise. 1=P, 2=C, 3=1B, 4=2B, 5=3B, 6=SS, 7=LF, 8=CF, 9=RF, 10=DH (DH used in some interleague-rule years)."
    sql: ${TABLE}.starting_position ;;
  }
  dimension: team_id {
    type: string
    description: "The player's team during the season they were selected (not the AL/NL ASG roster)."
    sql: ${TABLE}.teamID ;;
  }
  dimension: year_id {
    type: number
    description: "Season year of the All-Star Game."
    sql: ${TABLE}.yearID ;;
  }
  measure: count {
    type: count
  }
}
