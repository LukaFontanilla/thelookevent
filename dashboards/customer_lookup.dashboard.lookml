- dashboard: customer_lookup
  title: Customer Lookup
  layout: newspaper
  description: ''
  preferred_slug: MDDG8M9Lvb1S2zq5UuhUND
  embed_style:
    background_color: "#f6f8fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: User Info
    name: User Info
    model: thelook
    explore: order_items
    type: looker_single_record
    fields: [users.id, users.email, users.name, users.traffic_source, users.created_month,
      users.age, users.gender, users.city, users.state]
    filters:
      order_items.created_date: 99 years
      users.id: ''
    sorts: [users.created_month desc]
    limit: 1
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_null_labels: false
    show_row_numbers: true
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Email: users.email
    row: 0
    col: 0
    width: 7
    height: 6
  - title: Lifetime Orders
    name: Lifetime Orders
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    filters:
      order_items.created_date: 99 years
      users.id: ''
    sorts: [order_items.order_count desc]
    limit: 500
    show_null_labels: false
    user_access_filters: {}
    hidden_fields: []
    y_axes: []
    listen:
      Email: users.email
    row: 9
    col: 0
    width: 7
    height: 3
  - title: Total Items Returned
    name: Total Items Returned
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.count]
    filters:
      order_items.returned_date: NOT NULL
    sorts: [order_items.count desc]
    limit: 500
    show_null_labels: false
    font_size: medium
    text_color: black
    hidden_fields: []
    y_axes: []
    listen:
      Email: users.email
    row: 6
    col: 0
    width: 7
    height: 3
  - title: Items Order History
    name: Items Order History
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [order_items.id, products.item_name, order_items.status, order_items.created_date,
      order_items.shipped_date, order_items.delivered_date, order_items.returned_date,
      distribution_centers.name]
    sorts: [order_items.created_date desc]
    limit: 500
    show_view_names: true
    show_row_numbers: true
    hidden_fields: []
    y_axes: []
    listen:
      Email: users.email
    row: 12
    col: 0
    width: 16
    height: 5
  - title: Favorite Categories
    name: Favorite Categories
    model: thelook
    explore: order_items
    type: looker_pie
    fields: [products.category, order_items.count]
    filters:
      order_items.created_date: 99 years
    sorts: [order_items.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    series_colors: {}
    show_view_names: true
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Email: users.email
    row: 12
    col: 16
    width: 8
    height: 5
  - title: User Location
    name: User Location
    model: thelook
    explore: order_items
    type: looker_geo_coordinates
    fields: [users.count, users.location]
    sorts: [users.created_month desc]
    limit: 1
    column_limit: 50
    query_timezone: America/Los_Angeles
    map: usa
    map_projection: ''
    show_view_names: true
    point_color: "#4285F4"
    point_radius: 10
    font_size: medium
    text_color: "#49719a"
    map_plot_mode: points
    heatmap_gridlines: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    map_latitude: 42.35930500076174
    map_longitude: -71.02283477783203
    map_zoom: 11
    loading: false
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Email: users.email
    row: 3
    col: 7
    width: 17
    height: 9
  - title: Generate Promo Email
    name: Generate Promo Email
    model: thelook
    explore: order_items
    type: single_value
    fields: [users.promo_email]
    filters:
      order_items.created_date: 99 years
      users.id: ''
    sorts: [users.promo_email]
    limit: 1
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_null_labels: false
    show_row_numbers: true
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Email: users.email
    row: 0
    col: 7
    width: 17
    height: 3
  filters:
  - name: Email
    title: Email
    type: field_filter
    default_value: aacevedo@yahoo.com
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.email
