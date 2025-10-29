view: account {
  sql_table_name: `looker-private-demo.salesforce.account` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: account_source {
    type: string
    sql: ${TABLE}.account_source ;;
  }
  dimension: billing_city {
    type: string
    sql: ${TABLE}.billing_city ;;
  }
  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
  }
  dimension: billing_email_c {
    type: string
    sql: ${TABLE}.billing_email_c ;;
  }
  dimension: billing_latitude {
    type: number
    sql: ${TABLE}.billing_latitude ;;
  }
  dimension: billing_longitude {
    type: number
    sql: ${TABLE}.billing_longitude ;;
  }
  dimension: billing_postal_code {
    type: string
    sql: ${TABLE}.billing_postal_code ;;
  }
  dimension: billing_state {
    type: string
    sql: ${TABLE}.billing_state ;;
  }
  dimension: billing_street {
    type: string
    sql: ${TABLE}.billing_street ;;
  }
  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_date ;;
  }
  dimension_group: customer__end__date___c {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.customer__end__date___c ;;
  }
  dimension_group: customer__start__date___c {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.customer__start__date___c ;;
  }
  dimension: first_lead_id_c {
    type: string
    sql: ${TABLE}.FIRST_LEAD_ID_C ;;
  }
  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }
  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }
  dimension: jumpstart_nps_score_c {
    type: number
    sql: ${TABLE}.jumpstart_nps_score_c ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension_group: next_contract_renewal_date_c {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.next_contract_renewal_date_c ;;
  }
  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }
  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: region_c {
    type: string
    sql: ${TABLE}.region_c ;;
  }
  dimension: renewal_manager_c {
    type: string
    sql: ${TABLE}.renewal_manager_c ;;
  }
  dimension: risk_assessment_c {
    type: string
    sql: ${TABLE}.risk_assessment_c ;;
  }
  dimension: sdr_assigned_c {
    type: string
    sql: ${TABLE}.sdr_assigned_c ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.TYPE ;;
  }
  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }
  dimension: zendesk___zendesk__organization__id___c {
    type: string
    sql: ${TABLE}.ZENDESK___ZENDESK__ORGANIZATION__ID___C ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
