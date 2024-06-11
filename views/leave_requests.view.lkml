
view: leave_requests {
  derived_table: {
    sql: SELECT CASE WHEN RAND() < 0.5 THEN 'T' ELSE 'F' END AS `Claimed Maternity Leave`,
      CASE WHEN RAND() < 0.5 THEN 'T' ELSE 'F' END AS `Claimed Paternity Leave`,
      CASE WHEN RAND() < 0.5 THEN 'T' ELSE 'F' END AS `Claimed Baby Bonding Leave`,
      CASE WHEN RAND() < 0.5 THEN 'T' ELSE 'F' END AS `Claimed Disability Leave`,
      CASE WHEN RAND() < 0.5 THEN 'T' ELSE 'F' END AS `Claimed Bereavement`,
      CASE WHEN RAND() < 0.5 THEN 'T' ELSE 'F' END AS `Claimed Mental Health Leave`,
      FLOOR(RAND() * 50) + 1 as `Years Worked`,
      id, state, city, first_name || ' ' || last_name as full_name, email FROM users ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: years_worked {
    type: string
    label: "Years Worked"
    sql: ${TABLE}.`Years Worked` ;;
  }

  dimension: years_worked_tier {
    type: tier
    tiers: [10,20,30,40]
    style: integer
    sql: ${years_worked} ;;
  }

  dimension: claimed_maternity_leave {
    type: string
    label: "Claimed Maternity Leave"
    sql: ${TABLE}.`Claimed Maternity Leave` ;;
  }


  dimension: claimed_paternity_leave {
    type: string
    label: "Claimed Paternity Leave"
    sql: ${TABLE}.`Claimed Paternity Leave` ;;
  }

  dimension: claimed_baby_bonding_leave {
    type: string
    label: "Claimed Baby Bonding Leave"
    sql: ${TABLE}.`Claimed Baby Bonding Leave` ;;
  }

  dimension: claimed_disability_leave {
    type: string
    label: "Claimed Disability Leave"
    sql: ${TABLE}.`Claimed Disability Leave` ;;
  }

  dimension: claimed_bereavement {
    type: string
    label: "Claimed Bereavement"
    sql: ${TABLE}.`Claimed Bereavement` ;;
  }

  dimension: claimed_mental_health_leave {
    type: string
    label: "Claimed Mental Health Leave"
    sql: ${TABLE}.`Claimed Mental Health Leave` ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    action: {
      label: "Check in with Employee regarding Leave"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Checking in with {{ full_name._value }} !"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Dear {{ users.full_name._value }},

        We just wanted to reach out regarding some of the leave you've taken!"
      }
    }
  }

  measure: total_claimed_maternity_leave {
    type: count
    sql: ${claimed_maternity_leave} ;;
    filters: [claimed_maternity_leave: "T"]
    drill_fields: [state, city, full_name, email, id]
  }

  measure: total_claimed_paternity_leave {
    type: count
    sql: ${claimed_paternity_leave} ;;
    filters: [claimed_paternity_leave: "T"]
    drill_fields: [state, city, full_name, email, id]
  }

  measure: total_claimed_baby_bonding_leave {
    type: count
    sql: ${claimed_baby_bonding_leave} ;;
    filters: [claimed_baby_bonding_leave: "T"]
    drill_fields: [state, city, full_name, email, id]
  }

  measure: total_claimed_disability_leave {
    type: count
    sql: ${claimed_disability_leave} ;;
    filters: [claimed_disability_leave: "T"]
    drill_fields: [state, city, full_name, email, id]
  }

  measure: total_claimed_bereavement {
    type: count
    sql: ${claimed_bereavement} ;;
    filters: [claimed_bereavement: "T"]
    drill_fields: [state, city, full_name, email, id]
  }

  measure: total_claimed_mental_health_leave {
    type: count
    sql: ${claimed_mental_health_leave} ;;
    filters: [claimed_mental_health_leave: "T"]
    drill_fields: [state, city, full_name, email, id]
  }

  set: detail {
    fields: [
        total_claimed_baby_bonding_leave, total_claimed_bereavement, total_claimed_disability_leave, total_claimed_maternity_leave, total_claimed_mental_health_leave, total_claimed_paternity_leave,
  id,
  state,
  full_name
    ]
  }
}
