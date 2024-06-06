- dashboard: similar_audience_optimizer
  title: Similar Audience Optimizer
  layout: newspaper
  preferred_viewer: dashboards-next
  query_timezone: user_timezone
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    tile_separator_color: "#faf3f3"
    tile_border_radius: 5
    show_tile_shadow: false
    text_tile_text_color: "#556d7a"
  elements:
  - title: Total Orders
    name: Total Orders
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    filters: {}
    sorts: [order_items.order_count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    font_size: medium
    text_color: black
    hidden_fields: []
    y_axes: []
    listen:
      'New Audience: Brand': products.brand
      'New Audience: Age Tier': users.age_tier
      'New Audience: Category': products.category
    row: 22
    col: 8
    width: 4
    height: 3
  - title: Total Customers
    name: Total Customers
    model: thelook
    explore: order_items
    type: single_value
    fields: [users.count]
    filters: {}
    sorts: [users.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    font_size: medium
    text_color: black
    hidden_fields: []
    y_axes: []
    note_state: expanded
    note_display: hover
    note_text: I've added a note
    listen:
      'New Audience: Brand': products.brand
      'New Audience: Age Tier': users.age_tier
      'New Audience: Category': products.category
    row: 22
    col: 0
    width: 4
    height: 3
  - title: Average Order Value
    name: Average Order Value
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    filters: {}
    sorts: [order_items.average_sale_price desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    font_size: medium
    text_color: black
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: This Average LTV
    listen:
      'New Audience: Brand': products.brand
      'New Audience: Age Tier': users.age_tier
      'New Audience: Category': products.category
    row: 22
    col: 4
    width: 4
    height: 3
  - title: Brand Traffic by Source, OS
    name: Brand Traffic by Source, OS
    model: thelook
    explore: events
    type: looker_donut_multiples
    fields: [users.traffic_source, events.count, device_type]
    pivots: [users.traffic_source]
    filters:
      users.traffic_source: "-NULL"
      events.event_date: 90 days
    sorts: [events.count desc 1, users.traffic_source]
    limit: 20
    column_limit: 50
    dynamic_fields: [{dimension: device_type, label: Device Type, expression: 'if(${events.os}="Macintosh",
          "iOS", if(${events.os}="Windows","Desktop","Android"))', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string}]
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
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      Brand Name: product_viewed.brand
    row: 12
    col: 14
    width: 10
    height: 8
  - title: Top Product Categories - Cart vs Conversion
    name: Top Product Categories - Cart vs Conversion
    model: thelook
    explore: events
    type: looker_column
    fields: [product_viewed.category, sessions.cart_to_checkout_conversion, sessions.count_cart_or_later]
    filters:
      product_viewed.category: "-NULL"
    sorts: [sessions.count_cart_or_later desc]
    limit: 8
    column_limit: 50
    dynamic_fields: [{table_calculation: add_to_cart_checkout_conversion, label: Add
          to Cart -> Checkout Conversion, expression: 'min(list(max(list((${sessions.cart_to_checkout_conversion}-sum(${sessions.cart_to_checkout_conversion})/count(${sessions.cart_to_checkout_conversion}))*20+${sessions.cart_to_checkout_conversion},
          0.25)),0.95))', value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
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
    y_axes: [{label: Total Added to Cart, orientation: left, series: [{axisId: sessions.count_cart_or_later,
            id: sessions.count_cart_or_later, name: "# of Add to Cart Events"}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', valueFormat: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: '', orientation: right, series: [{axisId: add_to_cart_checkout_conversion,
            id: add_to_cart_checkout_conversion, name: Add to Cart -> Checkout Conversion}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_labels: [Cart to Checkout Conversion Percent, Total Added to Cart]
    hide_legend: false
    colors: ["#64518A", "#8D7FB9"]
    series_types:
      sessions.cart_to_checkout_conversion: line
      sessions.overall_conversion: line
      calculation_1: line
      add_to_cart_checkout_conversion: line
    series_colors:
      add_to_cart_checkout_conversion: "#FBBC04"
      sessions.count_cart_or_later: "#EA4335"
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
    hidden_fields: [sessions.cart_to_checkout_conversion]
    listen:
      Brand Name: product_viewed.brand
    row: 12
    col: 0
    width: 14
    height: 8
  - title: Sales and Sale Price Trend
    name: Sales and Sale Price Trend
    model: thelook
    explore: order_items
    type: looker_line
    fields: [inventory_items.created_week, order_items.total_sale_price, order_items.average_sale_price]
    fill_fields: [inventory_items.created_week]
    filters:
      order_items.created_date: 90 days
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
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: order_items.average_sale_price,
            id: order_items.average_sale_price, name: Average Sale Price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
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
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      'New Audience: Brand': products.brand
      'New Audience: Age Tier': users.age_tier
      'New Audience: Category': products.category
    row: 22
    col: 12
    width: 12
    height: 7
  - title: Top Purchasers of Brand
    name: Top Purchasers of Brand
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [users.name, users.email, order_items.count, order_items.total_sale_price,
      users.state]
    filters:
      order_items.created_date: 90 days
    sorts: [order_items.count desc]
    limit: 100
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    conditional_formatting_ignored_fields: []
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      'New Audience: Brand': products.brand
      'New Audience: Age Tier': users.age_tier
      'New Audience: Category': products.category
    row: 25
    col: 0
    width: 12
    height: 10
  - title: Purchasers of This Brand Also Bought (Brand Affinity)
    name: Purchasers of This Brand Also Bought (Brand Affinity)
    model: thelook
    explore: affinity
    type: looker_grid
    fields: [product_a.brand, product_b.brand, affinity.avg_order_affinity, affinity.avg_user_affinity,
      affinity.combined_affinity, product_b.count]
    filters:
      affinity.product_b_id: "-NULL"
      affinity.avg_order_affinity: NOT NULL
      is_same_brand: 'No'
    sorts: [product_b.count desc]
    limit: 15
    column_limit: 50
    dynamic_fields: [{dimension: is_same_brand, label: Is Same Brand, expression: "${product_a.brand}\
          \ = ${product_b.brand}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: yesno}]
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    series_types: {}
    y_axes: []
    defaults_version: 1
    listen:
      Brand Name: product_a.brand
    row: 3
    col: 10
    width: 14
    height: 9
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
    series_types: {}
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      'New Audience: Brand': order_items_share_of_wallet.brand
      'New Audience: Age Tier': users.age_tier
      'New Audience: Category': products.category
    row: 29
    col: 12
    width: 12
    height: 6
  - name: "<span>New Audience Stats </span>"
    type: text
    title_text: "<span>New Audience Stats </span>"
    subtitle_text: Review the performance of the audience before sending to Customer
      Match
    body_text: ''
    row: 20
    col: 0
    width: 24
    height: 2
  - name: "<span'> Brand Analysis </span>"
    type: text
    title_text: "<span'> Brand Analysis </span>"
    subtitle_text: Who buys these products, and what else do they buy?
    body_text: "**Recommended Action** Target your cohort to highest-spending segments,\
      \ and expand your reach to buyers of similar brands"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Customer Age
    name: Customer Age
    model: thelook
    explore: order_items
    type: looker_column
    fields: [users.age_tier, order_items.total_sale_price, users.gender]
    pivots: [users.gender]
    filters:
      users.age: ">19"
    sorts: [users.age_tier, users.gender]
    limit: 500
    dynamic_fields: [{measure: average_basket_size, based_on: order_facts.order_amount,
        type: average, label: Average Basket Size, expression: !!null '', value_format: !!null '',
        value_format_name: usd, _kind_hint: measure, _type_hint: number}]
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
    trellis: pivot
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
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: Female - order_items.total_sale_price, name: Female}, {axisId: order_items.total_sale_price,
            id: Male - order_items.total_sale_price, name: Male}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    hide_legend: true
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Brand Name: products.brand
    row: 3
    col: 0
    width: 10
    height: 9
  filters:
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
  - name: 'New Audience: Brand'
    title: 'New Audience: Brand'
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: thelook
    explore: events
    listens_to_filters: []
    field: product_viewed.brand
  - name: 'New Audience: Age Tier'
    title: 'New Audience: Age Tier'
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.age_tier
  - name: 'New Audience: Category'
    title: 'New Audience: Category'
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: products.category
