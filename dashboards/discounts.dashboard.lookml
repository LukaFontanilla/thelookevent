- dashboard: ecommerce_discount_portal
  title: E-Commerce Discount Portal
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: E-Commerce Writeback
    name: E-Commerce Writeback
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [inventory_items.created_date, products.item_name, products.category,
      inventory_items.cost, products.retail_price, inventory_items.id, products.id]
    filters:
      inventory_items.sold_date: 'NULL'
    sorts: [inventory_items.created_date desc]
    limit: 500
    column_limit: 50
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: [inventory_items.id, products.id]
    listen:
      Days in Inventory: inventory_items.days_in_inventory_tier
    row: 2
    col: 0
    width: 13
    height: 17
  - title: Discounts
    name: Discounts
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [discounts.date_date, products.item_name, discounts.discount_price, discounts.discount_amount,
      discounts.retail_price]
    sorts: [discounts.date_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
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
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-diverging-0,
          options: {steps: 5, constraints: {min: {type: minimum}}, reverse: true,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: [
          discounts.discount_amount]}]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 2
    col: 13
    width: 11
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Discounted Items"
    row: 0
    col: 13
    width: 11
    height: 2
  - title: Discounted Items by Category
    name: Discounted Items by Category
    model: thelook
    explore: order_items
    type: looker_bar
    fields: [products.category, products.count]
    filters:
      discounts.product_id: NOT NULL
    sorts: [products.count desc]
    limit: 500
    column_limit: 50
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
    stacking: ''
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
    defaults_version: 1
    series_types: {}
    row: 8
    col: 13
    width: 6
    height: 11
  - title: Discounts by Department
    name: Discounts by Department
    model: thelook
    explore: order_items
    type: looker_pie
    fields: [products.count, products.department]
    filters:
      discounts.product_id: NOT NULL
    sorts: [products.count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
    stacking: ''
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
    defaults_version: 1
    series_types: {}
    row: 8
    col: 19
    width: 5
    height: 11
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Unsold Items"
    row: 0
    col: 0
    width: 13
    height: 2
  filters:
  - name: Days in Inventory
    title: Days in Inventory
    type: field_filter
    default_value: 80 to 159
    allow_multiple_values: true
    required: false
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: inventory_items.days_in_inventory_tier
