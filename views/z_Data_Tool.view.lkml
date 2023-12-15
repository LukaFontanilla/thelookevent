include: "/views/01_order_items.view.lkml"

view: +order_items {

  parameter: timeframe_filter {
    label: "Timeframe Filter"
    view_label: "Z) Data Tool"
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
  }

  dimension: timeframe {
    label: "Timeframe"
    view_label: "Z) Data Tool"
    sql: CASE
          WHEN {% parameter timeframe_filter %} = 'Date' THEN cast(${created_date} as string)
          WHEN {% parameter timeframe_filter %} = 'Week' THEN ${created_week}
          WHEN {% parameter timeframe_filter %} = 'Month' THEN ${created_month}
        END ;;
    label_from_parameter: timeframe_filter
    drill_fields: [created_date,created_week,created_month,products.brand,products.category,]
  }

  parameter: primary_metric_filter {
    label: "Primary Metric Filter"
    view_label: "Z) Data Tool"
    allowed_value: { value: "Avg Days to Process" }
    allowed_value: { value: "Returns" }
    allowed_value: { value: "Orders" }
    default_value: "Orders"
  }

  measure: primary_metric {
    label: "Primary Metric"
    type: number
    view_label: "Z) Data Tool"
    value_format: "[<=10]0.00;#,###"
    sql: CASE
          WHEN {% parameter primary_metric_filter %} = 'Avg Days to Process' THEN ${average_days_to_process}
          WHEN {% parameter primary_metric_filter %} = 'Returns' THEN ${returned_count}
          WHEN {% parameter primary_metric_filter %} = 'Orders' THEN ${order_count}
        END ;;
    label_from_parameter: primary_metric_filter
    drill_fields: []
  }

  parameter: second_metric_filter {
    label: "Second Metric Filter"
    view_label: "Z) Data Tool"
    allowed_value: { value: "Revenue" }
    allowed_value: { value: "Average Item Price" }
    allowed_value: { value: "Returned Sales" }
    default_value: "Revenue"
  }

  measure: second_metric {
    label: "Second Metric"
    type: number
    value_format_name: usd
    view_label: "Z) Data Tool"
    sql: CASE
          WHEN {% parameter second_metric_filter %} = 'Revenue' THEN ${total_sale_price}
          WHEN {% parameter second_metric_filter %} = 'Average Item Price' THEN ${average_sale_price}
          WHEN {% parameter second_metric_filter %} = 'Returned Sales' THEN ${returned_total_sale_price}
        END ;;
    label_from_parameter: second_metric_filter
    drill_fields: []
  }




}
