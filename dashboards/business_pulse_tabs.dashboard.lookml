---
- dashboard: _business_pulse_and_brand_lookup
  title: " Business Pulse and Brand Lookup"
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: ZwBBzlGNOInLweOBvDEIBW
  theme_name: ''
  layout: newspaper
  tabs:
  - name: Business Pulse
    label: Business Pulse
  - name: Brand Lookup
    label: Brand Lookup
  elements:
  - title: Number of First Purchasers
    name: Number of First Purchasers
    model: thelook
    explore: order_items
    type: single_value
    fields: [users.count]
    filters:
      users.created_date: 7 days
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal
      label: Goal
      expression: '10000'
      value_format:
      value_format_name: decimal_0
      _kind_hint: dimension
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: medium
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
    text_color: black
    single_value_title: New Users Acquired
    custom_color: forestgreen
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 2
    col: 0
    width: 4
    height: 4
    tab_name: Business Pulse
  - title: Average Order Sale Price
    name: Average Order Sale Price
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    sorts: [orders.average_profit desc, order_items.average_sale_price desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: date
      label: date
      expression: now()
      value_format:
      value_format_name:
      _kind_hint: dimension
      is_disabled: true
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: forestgreen
    show_view_names: true
    font_size: medium
    text_color: black
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    note_state: expanded
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 2
    col: 4
    width: 4
    height: 4
    tab_name: Business Pulse
  - title: Orders by Day and Category
    name: Orders by Day and Category
    model: thelook
    explore: order_items
    type: looker_area
    fields: [products.category, order_items.count, order_items.created_date]
    pivots: [products.category]
    fill_fields: [order_items.created_date]
    filters:
      products.category: Blazers & Jackets,Sweaters,Pants,Shorts,Fashion Hoodies &
        Sweatshirts,Accessories
    sorts: [products.category, order_items.created_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: Number of Orders, orientation: left, series: [{id: Accessories
              - order_items.count, name: Accessories, axisId: order_items.count},
          {id: Blazers & Jackets - order_items.count, name: Blazers &amp; Jackets,
            axisId: order_items.count}, {id: Fashion Hoodies & Sweatshirts - order_items.count,
            name: Fashion Hoodies &amp; Sweatshirts, axisId: order_items.count}, {
            id: Pants - order_items.count, name: Pants, axisId: order_items.count},
          {id: Shorts - order_items.count, name: Shorts, axisId: order_items.count},
          {id: Sweaters - order_items.count, name: Sweaters, axisId: order_items.count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_labels: ["# Order Items"]
    hide_legend: false
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    series_colors: {}
    x_axis_datetime_tick_count: 4
    x_axis_datetime: true
    hide_points: true
    hidden_fields: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 6
    col: 0
    width: 16
    height: 6
    tab_name: Business Pulse
  - title: Website Visit Volume vs Conversion Rate
    name: Website Visit Volume vs Conversion Rate
    model: thelook
    explore: events
    type: looker_column
    fields: [events.event_day_of_week, events.sessions_count, events.unique_visitors,
      sessions.overall_conversion]
    sorts: [events.event_day_of_week]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: events.unique_visitors,
            name: Unique Visitors}, {id: events.sessions_count, name: Sessions Count}]},
      {label: '', maxValue: !!null '', minValue: !!null '', orientation: right, showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false, valueFormat: !!null '', series: [{id: sessions.overall_conversion,
            name: Conversion Rate}]}]
    colors: ["#1EA8DF", "#8ED3EF", "#B1A8C4", "#635189"]
    series_types:
      events.unique_visitors: line
      events.sessions_count: line
    series_colors: {}
    series_labels:
      sessions.overall_conversion: Conversion Rate
      events.sessions_count: Total Visitors
    label_color: ["#EA8A2F", "#e9b404"]
    y_axis_orientation: [left, right]
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: events.event_date
      Country: users.country
    row: 26
    col: 0
    width: 10
    height: 7
    tab_name: Business Pulse
  - title: Percent of Cohort Still Active by Traffic Source
    name: Percent of Cohort Still Active by Traffic Source
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.months_since_signup, users.count, users.traffic_source]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0, 12]"
      users.created_month: 12 months
    sorts: [order_items.months_since_signup, users.age_tier__sort_, users.traffic_source]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: pct_cohort_still_active
      label: Pct Cohort Still Active
      expression: "${users.count} / max(${users.count})"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: Percent of Cohort still Active, orientation: left, series: [
          {axisId: pct_cohort_still_active, id: Display - pct_cohort_still_active,
            name: Display}, {axisId: pct_cohort_still_active, id: Email - pct_cohort_still_active,
            name: Email}, {axisId: pct_cohort_still_active, id: Facebook - pct_cohort_still_active,
            name: Facebook}, {axisId: pct_cohort_still_active, id: Organic - pct_cohort_still_active,
            name: Organic}, {axisId: pct_cohort_still_active, id: Search - pct_cohort_still_active,
            name: Search}], showLabels: true, showValues: true, maxValue: !!null '',
        valueFormat: 0%, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    y_axis_max: ['50']
    y_axis_labels: [Percent of Cohort still Active]
    y_axis_value_format: "#\\%"
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    series_colors: {}
    swap_axes: false
    discontinuous_nulls: false
    hidden_fields: [cumulative_lifetime_spend, order_items.total_sale_price, users.count]
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 42
    col: 10
    width: 14
    height: 7
    tab_name: Business Pulse
  - title: Total Sales, Year over Year
    name: Total Sales, Year over Year
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.created_month_name, order_items.total_sale_price, order_items.created_year]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_month_name]
    filters:
      order_items.created_date: before 0 months ago
      order_items.created_year: 4 years
    sorts: [order_items.created_year desc 0, order_items.created_month_name]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: '2018', name: '2018', axisId: order_items.total_sale_price},
          {id: '2017', name: '2017', axisId: order_items.total_sale_price}, {id: '2016',
            name: '2016', axisId: order_items.total_sale_price}, {id: '2015', name: '2015',
            axisId: order_items.total_sale_price}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear, valueFormat: "$0,\\\
          K\\"}]
    y_axis_value_format: "$#,##0"
    x_axis_label: Month of Year
    colors: ["#635189", "#B1A8C4", "#1EA8DF", "#8ED3EF"]
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [calculation_1]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 2
    col: 16
    width: 8
    height: 10
    tab_name: Business Pulse
  - title: Highest Spending Users
    name: Highest Spending Users
    model: thelook
    explore: order_items
    type: looker_map
    fields: [users.approx_location, users.gender, order_items.order_count, users.count,
      order_items.total_sale_price, order_items.average_spend_per_user, users.country]
    pivots: [users.gender]
    sorts: [users.gender 0, order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 37.57941251343841
    map_longitude: -99.31640625000001
    map_zoom: 4
    map_marker_radius_max: 15
    map_marker_color: ["#4285F4", "#EA4335", "#FBBC04", "#34A853"]
    map_value_colors: [white, purple]
    map_value_scale_clamp_min: 0
    map_value_scale_clamp_max: 200
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    loading: false
    hidden_fields: [orders.count, users.count, order_items.total_sale_price, order_items.order_count]
    map: usa
    map_projection: ''
    quantize_colors: false
    colors: [whitesmoke, "#64518A"]
    outer_border_color: "#64518A"
    inner_border_color: ''
    inner_border_width: 0.6
    outer_border_width: 2
    empty_color: ''
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Bubble size corresponds to average user spend
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 14
    col: 10
    width: 14
    height: 9
    tab_name: Business Pulse
  - title: User Behaviors by Traffic Source
    name: User Behaviors by Traffic Source
    model: thelook
    explore: order_items
    type: looker_column
    fields: [users.traffic_source, order_items.average_sale_price, user_order_facts.average_lifetime_orders]
    sorts: [user_order_facts.lifetime_orders_tier__sort_, users.traffic_source]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: order_items.average_sale_price,
            name: Average Sale Price, axisId: order_items.average_sale_price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{id: user_order_facts.average_lifetime_orders,
            name: Average Lifetime Orders, axisId: user_order_facts.average_lifetime_orders}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_labels: [Average Sale Price ($)]
    y_axis_value_format: '0'
    hide_legend: false
    colors: ["#1ea8df", "#a2dcf3", "#929292", "#9fdee0", "#1f3e5a", "#90c8ae", "#92818d",
      "#c5c6a6", "#82c2ca", "#cee0a0", "#928fb4", "#9fc190"]
    font_size: '13'
    series_colors: {}
    y_axis_orientation: [left, right]
    hidden_fields: [percent_repeat_customers]
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 35
    col: 0
    width: 10
    height: 7
    tab_name: Business Pulse
  - title: User Basic Demographic Profile
    name: User Basic Demographic Profile
    model: thelook
    explore: order_items
    type: looker_donut_multiples
    fields: [users.gender, users.traffic_source, order_items.count]
    pivots: [users.traffic_source]
    sorts: [user_order_facts.lifetime_orders_tier__sort_, users.traffic_source, order_items.count
        desc 0]
    limit: 500
    column_limit: 15
    query_timezone: America/Los_Angeles
    show_value_labels: true
    font_size: 15
    hide_legend: false
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    series_colors: {}
    show_view_names: true
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 14
    col: 0
    width: 10
    height: 9
    tab_name: Business Pulse
  - title: 30 Day Repeat Purchase Rate
    name: 30 Day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate]
    sorts: [repeat_purchase_facts.30_day_repeat_purchase_rate desc, order_items.30_day_repeat_purchase_rate
        desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color: ''
    single_value_title: Repeat Purchase Rate
    conditional_formatting: [{type: greater than, value: 0.1, background_color: "#ffffe5",
        font_color: "#FBB555", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0.13,
        background_color: '', font_color: "#C2DD67", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0.15,
        background_color: '', font_color: "#72D16D", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    font_size: medium
    text_color: black
    colors: ["#1f78b4", "#a6cee3", "#33a02c", "#b2df8a", "#e31a1c", "#fb9a99", "#ff7f00",
      "#fdbf6f", "#6a3d9a", "#cab2d6", "#b15928", "#edbc0e"]
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: What percent of orders are followed by a repeat purchase by the same
      user within 30 days?
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 2
    col: 8
    width: 4
    height: 4
    tab_name: Business Pulse
  - title: Total Order Count
    name: Total Order Count
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.count, order_items.created_year]
    fill_fields: [order_items.created_year]
    filters:
      users.state: ''
      users.city: ''
      users.traffic_source: ''
      users.gender: ''
      distribution_centers.location: ''
      users.country: ''
      order_items.created_year: 2 years
    sorts: [order_items.created_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_change
      label: Percent Change
      expression: "${order_items.count}/offset(${order_items.count},1) - 1"
      value_format:
      value_format_name: percent_0
      is_disabled: true
    - args:
      - order_items.count
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: order_items.count
      label: Percent change from previous - Order Items Count
      source_field: order_items.count
      table_calculation: percent_change_from_previous_order_items_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - args:
      - order_items.count
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: order_items.count
      label: Percent change from previous - Order Items Count
      source_field: order_items.count
      table_calculation: percent_change_from_previous_order_items_count_2
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    single_value_title: Orders This Year
    hidden_fields: [order_items.reporting_period, order_items.created_year]
    comparison_label: vs Same Period Last Year
    custom_color: forestgreen
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: ''
    hidden_pivots: {}
    defaults_version: 1
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 2
    col: 12
    width: 4
    height: 4
    tab_name: Business Pulse
  - name: "<span class='fa fa-users'> </span> Customer Demographics"
    type: text
    title_text: "<span class='fa fa-users'> </span> Customer Demographics"
    subtitle_text: Who are our customers?
    row: 12
    col: 0
    width: 24
    height: 2
    tab_name: Business Pulse
  - title: Most Viewed Brands Online
    name: Most Viewed Brands Online
    model: thelook
    explore: sessions
    type: looker_grid
    fields: [product_viewed.brand, sessions.count, sessions.cart_to_checkout_conversion,
      product_viewed.department]
    pivots: [product_viewed.department]
    filters:
      product_viewed.brand: "-NULL"
    sorts: [sessions.count desc 0, product_viewed.department]
    limit: 10
    column_limit: 50
    row_total: right
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      sessions.cart_to_checkout_conversion: Cart Conversion
    series_cell_visualizations:
      sessions.count:
        is_active: true
        palette:
          palette_id: google-sequential-0
          collection_id: google
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#2196F3",
        font_color: !!null '', color_application: {collection_id: f14810d2-98d7-42df-82d0-bc185a074e42,
          palette_id: 493e0f89-1e28-4f9b-9f49-9cb1e77a0331}, bold: false, italic: false,
        strikethrough: false, fields: [sessions.cart_to_checkout_conversion]}]
    conditional_formatting_ignored_fields: []
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    truncate_column_names: true
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      Country: users.country
    row: 35
    col: 10
    width: 14
    height: 7
    tab_name: Business Pulse
  - name: "<span class='fa fa-laptop'> </span> Web Analytics"
    type: text
    title_text: "<span class='fa fa-laptop'> </span> Web Analytics"
    subtitle_text: What are customers doing on our website?
    body_text: "**Recommended Action** Dive into successful brands to see what they're\
      \ doing that's working, drill by category or head to the Brand Analytics report"
    row: 23
    col: 0
    width: 24
    height: 3
    tab_name: Business Pulse
  - name: "<span class='fa fa-tachometer'> Top Line Metrics</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Top Line Metrics</span>"
    subtitle_text: Are we headed in the right direction?
    row: 0
    col: 0
    width: 24
    height: 2
    tab_name: Business Pulse
  - title: Top Visitors and Transaction History
    name: Top Visitors and Transaction History
    model: thelook
    explore: events
    type: looker_grid
    fields: [users.name, users.email, users.state, users.traffic_source, sessions.count]
    filters:
      users.name: "-NULL"
    sorts: [sessions.count desc]
    limit: 15
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      sessions.count:
        is_active: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting_ignored_fields: []
    truncate_column_names: false
    listen:
      Date: events.event_date
      State: users.state
    row: 42
    col: 12
    width: 12
    height: 8
    tab_name: Brand Lookup
  - title: Website Sessions by Hour of Day and User Lifetime Order Tier
    name: Website Sessions by Hour of Day and User Lifetime Order Tier
    model: thelook
    explore: events
    type: looker_column
    fields: [user_order_facts.lifetime_orders_tier, sessions.count, events.event_hour_of_day]
    pivots: [user_order_facts.lifetime_orders_tier]
    fill_fields: [events.event_hour_of_day]
    sorts: [user_order_facts.lifetime_orders_tier 0, events.event_hour_of_day]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    hidden_series: [Undefined]
    colors: ["#2DA5DE", "#57BEBE", "#EA8A2F", "#F2B431", "#64518A", "#8D7FB9", "#7F7977",
      "#B2A898", "#494C52"]
    series_colors: {}
    series_labels:
      '1': 1 Lifetime Purchase
      1 - 2 - sessions.count: '1'
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: These are order totals by hour of day
    listen:
      Date: events.event_date
      State: users.state
    row: 34
    col: 0
    width: 14
    height: 5
    tab_name: Brand Lookup
  - title: Total Orders
    name: Total Orders
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    sorts: [order_items.order_count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    font_size: medium
    text_color: black
    listen:
      Date: order_items.created_date
      State: users.state
      Brand Name: products.brand
    row: 2
    col: 8
    width: 4
    height: 3
    tab_name: Brand Lookup
  - title: Total Customers
    name: Total Customers
    model: thelook
    explore: order_items
    type: single_value
    fields: [users.count]
    sorts: [users.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    font_size: medium
    text_color: black
    note_state: expanded
    note_display: hover
    note_text: I've added a note
    listen:
      Date: order_items.created_date
      State: users.state
      Brand Name: products.brand
    row: 2
    col: 0
    width: 4
    height: 3
    tab_name: Brand Lookup
  - title: Average Order Value
    name: Average Order Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    sorts: [order_items.average_sale_price desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    font_size: medium
    text_color: black
    note_state: collapsed
    note_display: below
    note_text: ''
    listen:
      Date: order_items.created_date
      State: users.state
      Brand Name: products.brand
    row: 2
    col: 4
    width: 4
    height: 3
    tab_name: Brand Lookup
  - title: Brand Traffic by Source, OS
    name: Brand Traffic by Source, OS
    model: thelook
    explore: events
    type: looker_donut_multiples
    fields: [users.traffic_source, events.os, events.count]
    pivots: [users.traffic_source]
    filters:
      users.traffic_source: "-NULL"
    sorts: [events.count desc 1, users.traffic_source]
    limit: 20
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_value_labels: true
    font_size: 12
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    series_colors: {}
    show_view_names: true
    stacking: ''
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_labels: false
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      Date: events.event_date
      State: users.state
      Brand Name: product_viewed.brand
    row: 28
    col: 14
    width: 10
    height: 11
    tab_name: Brand Lookup
  - name: "<span class='fa fa-laptop'> Web Analytics </span>"
    type: text
    title_text: "<span class='fa fa-laptop'> Web Analytics </span>"
    subtitle_text: How are users interacting with our website?
    row: 26
    col: 0
    width: 24
    height: 2
    tab_name: Brand Lookup
  - title: Top Product Categories - Cart vs Conversion
    name: Top Product Categories - Cart vs Conversion
    model: thelook
    explore: events
    type: looker_column
    fields: [product_viewed.category, sessions.overall_conversion, sessions.cart_to_checkout_conversion,
      sessions.count_cart_or_later]
    filters:
      product_viewed.category: "-NULL"
    sorts: [sessions.count_cart_or_later desc]
    limit: 8
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: Total Added to Cart, maxValue: !!null '', minValue: !!null '',
        orientation: left, showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: !!null '',
        series: [{id: sessions.count_cart_or_later, name: "(4) Add to Cart or later"}]},
      {label: '', maxValue: !!null '', minValue: !!null '', orientation: right, showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false, valueFormat: !!null '', series: [{id: sessions.overall_conversion,
            name: Overall Conversion}, {id: sessions.cart_to_checkout_conversion,
            name: Cart to Checkout Conversion}]}]
    y_axis_labels: [Cart to Checkout Conversion Percent, Total Added to Cart]
    hide_legend: false
    colors: ["#64518A", "#8D7FB9"]
    series_types:
      sessions.cart_to_checkout_conversion: line
      sessions.overall_conversion: line
    series_colors: {}
    series_labels:
      sessions.cart_to_checkout_conversion: Cart to Checkout Conversion
      sessions.overall_conversion: Overall Conversion
      sessions.count_cart_or_later: "# of Add to Cart Events"
    y_axis_orientation: [right, left]
    x_axis_label_rotation: -45
    label_rotation: 0
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date: events.event_date
      State: users.state
      Brand Name: product_viewed.brand
    row: 28
    col: 0
    width: 14
    height: 6
    tab_name: Brand Lookup
  - title: Sales and Sale Price Trend
    name: Sales and Sale Price Trend
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.created_date, order_items.total_sale_price, order_items.average_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axis_labels: [Total Sale Amount, Average Selling Price]
    x_axis_label: Order Date
    hide_legend: true
    colors: ["#F2B431", "#57BEBE"]
    series_colors: {}
    y_axis_orientation: [left, right]
    x_axis_datetime: true
    hide_points: true
    color_palette: Custom
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      Date: order_items.created_date
      State: users.state
      Brand Name: products.brand
    row: 2
    col: 12
    width: 12
    height: 7
    tab_name: Brand Lookup
  - title: Top Purchasers of Brand
    name: Top Purchasers of Brand
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [users.name, users.email, order_items.count, order_items.total_sale_price,
      users.state]
    sorts: [order_items.count desc]
    limit: 15
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Date: order_items.created_date
      State: users.state
      Brand Name: products.brand
    row: 42
    col: 0
    width: 12
    height: 8
    tab_name: Brand Lookup
  - title: Most Correlated Items
    name: Most Correlated Items
    model: thelook
    explore: affinity
    type: looker_grid
    fields: [product_a.item_name, product_b.item_name, affinity.avg_order_affinity,
      affinity.avg_user_affinity]
    filters:
      affinity.product_b_id: "-NULL"
      affinity.avg_order_affinity: NOT NULL
      product_b.brand: '"Levi''s"'
    sorts: [affinity.avg_order_affinity desc]
    limit: 15
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: false
    series_cell_visualizations:
      affinity.avg_order_affinity:
        is_active: true
        palette:
          palette_id: 14bc3e56-1edb-5cb6-143e-bc3c0d49dc0f
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#f20265"
          - "#FFD95F"
          - "#72D16D"
      affinity.avg_user_affinity:
        is_active: true
        palette:
          palette_id: 8182e447-1db4-af27-fe8f-0cc57a1b4132
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#f20265"
          - "#FFD95F"
          - "#72D16D"
    stacking: ''
    trellis: ''
    colors: ["#57BEBE", "#EA8A2F", "#F2B431", "#64518A", "#8D7FB9", "#7F7977", "#B2A898",
      "#494C52"]
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle_outline
    hidden_series: [product_a.count, product_b.count]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    color_palette: Custom
    hidden_fields: []
    defaults_version: 1
    listen:
      Brand Name: product_a.brand
    row: 18
    col: 0
    width: 14
    height: 8
    tab_name: Brand Lookup
  - title: Purchasers of This Brand Also Bought (Brand Affinity)
    name: Purchasers of This Brand Also Bought (Brand Affinity)
    model: thelook
    explore: affinity
    type: looker_grid
    fields: [product_a.brand, product_b.brand, affinity.avg_order_affinity, affinity.avg_user_affinity,
      affinity.combined_affinity]
    filters:
      affinity.product_b_id: "-NULL"
      affinity.avg_order_affinity: NOT NULL
    sorts: [affinity.combined_affinity desc]
    limit: 15
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_labels:
      product_b.brand: Brand Name
    series_cell_visualizations:
      affinity.avg_order_affinity:
        is_active: true
        palette:
          palette_id: 17151457-0425-49e1-f2ab-69c3b7658883
          collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
          custom_colors:
          - "#f20265"
          - "#FFD95F"
          - "#72D16D"
      affinity.avg_user_affinity:
        is_active: true
        palette:
          palette_id: 2c7c9b87-e295-002c-4f6f-d50381deac58
          collection_id: f14810d2-98d7-42df-82d0-bc185a074e42
          custom_colors:
          - "#f20265"
          - "#FFD95F"
          - "#72D16D"
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting_ignored_fields: []
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    hidden_fields: [affinity.combined_affinity, product_a.brand]
    truncate_column_names: false
    listen:
      Brand Name: product_a.brand
    row: 18
    col: 14
    width: 10
    height: 8
    tab_name: Brand Lookup
  - title: Brand Share of Wallet over Customer Lifetime
    name: Brand Share of Wallet over Customer Lifetime
    model: thelook
    explore: orders_with_share_of_wallet_application
    type: looker_line
    fields: [order_items.months_since_signup, order_items_share_of_wallet.brand_share_of_wallet_within_company,
      order_items_share_of_wallet.total_sale_price_brand_v2]
    filters:
      order_items.months_since_signup: "<=18"
    sorts: [order_items.months_since_signup]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{id: order_items_share_of_wallet.brand_share_of_wallet_within_company,
            name: Brand Share of Wallet Within Company, axisId: order_items_share_of_wallet.brand_share_of_wallet_within_company}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{id: order_items_share_of_wallet.total_sale_price_brand_v2, name: Total
              Sales - This Brand, axisId: order_items_share_of_wallet.total_sale_price_brand_v2}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors: {}
    defaults_version: 1
    listen:
      Date: order_items.created_date
      State: users.state
      Brand Name: order_items_share_of_wallet.brand
    row: 9
    col: 12
    width: 12
    height: 6
    tab_name: Brand Lookup
  - title: Most Popular Categories
    name: Most Popular Categories
    model: thelook
    explore: order_items
    type: looker_column
    fields: [products.category, products.department, order_items.total_sale_price]
    pivots: [products.department]
    sorts: [products.department 0, order_items.total_sale_price desc 2]
    limit: 500
    column_limit: 50
    row_total: right
    query_timezone: user_timezone
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 5
    col: 0
    width: 12
    height: 10
    tab_name: Brand Lookup
  - name: "<span class='fa fa-dollar'> Brand Overview </span>"
    type: text
    title_text: "<span class='fa fa-dollar'> Brand Overview </span>"
    subtitle_text: What are the high level revenue metrics for this brand?
    row: 0
    col: 0
    width: 24
    height: 2
    tab_name: Brand Lookup
  - name: "<span class='fa fa-heart'> Affinity Analysis </span>"
    type: text
    title_text: "<span class='fa fa-heart'> Affinity Analysis </span>"
    subtitle_text: What products and brands have the highest affinity?
    body_text: "**Recommended Action** Plan advertising campaign to recommend products\
      \ to users based on affinity"
    row: 15
    col: 0
    width: 24
    height: 3
    tab_name: Brand Lookup
  - name: "<span class='fa fa-users'> Top Customers </span>"
    type: text
    title_text: "<span class='fa fa-users'> Top Customers </span>"
    subtitle_text: Who are our highest valued customers?
    body_text: "**Recommended Action** Explore from here to see what products a user\
      \ has purchased and include them in a targeted advertising campaign"
    row: 39
    col: 0
    width: 24
    height: 3
    tab_name: Brand Lookup
  filters:
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: [Country]
    field: users.state
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: [State, Country]
    field: users.city
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.traffic_source
  - name: User Gender
    title: User Gender
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.gender
  - name: Date
    title: Date
    type: date_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: distribution_centers.location
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.country
  - name: Brand Name
    title: Brand Name
    type: field_filter
    default_value: Calvin Klein
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: products.brand
