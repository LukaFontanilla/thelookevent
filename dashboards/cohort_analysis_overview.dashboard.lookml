#cohort analysis overview
- dashboard: cohort_analysis_overview
  title: Cohort Analysis Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Spend by Region
    name: Spend by Region
    model: thelook
    explore: ecomm_predict
    type: looker_map
    fields: [users.count, users.state]
    filters:
      users.country: USA
    sorts: [users.count desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: outdoors
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 40.439822964501055
    map_longitude: -64.9281692504883
    map_zoom: 3
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
    trellis: row
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    trellis_rows: 3
    series_types: {}
    column_group_spacing_ratio:
    show_null_points: true
    interpolation: linear
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      users.count:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 11, mirror: true,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: [
          users.count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 7
    col: 5
    width: 6
    height: 6
  - title: Top 5 Categories
    name: Top 5 Categories
    model: thelook
    explore: ecomm_predict
    type: looker_bar
    fields: [products.category, order_items.count]
    sorts: [order_items.count desc]
    limit: 5
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
    series_types: {}
    series_colors:
      order_items.count: "#4285F4"
    defaults_version: 1
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 7
    col: 11
    width: 5
    height: 6
  - title: "#1 Brand"
    name: "#1 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{table_calculation: top_1, label: Top 1, expression: row() =
          1, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_1]
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 9
    col: 0
    width: 5
    height: 2
  - title: "#2 Brand"
    name: "#2 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{table_calculation: top_2, label: Top 2, expression: row() =
          2, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_2]
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 11
    col: 0
    width: 5
    height: 2
  - title: "#3 Brand"
    name: "#3 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{table_calculation: top_3, label: Top 3, expression: row() =
          3, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_3]
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 13
    col: 0
    width: 5
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h1 style="text-align: center;">Top 5 Brands 🔥</h1>'
    row: 7
    col: 0
    width: 5
    height: 2
  - title: Total Sales
    name: Total Sales
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.total_sale_price, order_items.created_month]
    sorts: [order_items.created_month desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{table_calculation: this_month_vs_last_month, label: This Month
          vs Last Month, expression: "${order_items.total_sale_price}/offset(${order_items.total_sale_price},1)-1",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: vs Last Month
    series_types: {}
    defaults_version: 1
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 6
    width: 6
    height: 4
  - title: Total Dollars Returned
    name: Total Dollars Returned
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.created_month, order_items.total_sale_price]
    filters:
      order_items.is_returned: 'Yes'
    sorts: [order_items.created_month desc]
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${order_items.total_sale_price}/offset(${order_items.total_sale_price},1)\
          \ -1 ", value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    comparison_label: vs Last Month
    conditional_formatting: []
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
    hidden_fields: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 12
    width: 6
    height: 4
  - title: New Users
    name: New Users
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [users.created_month, users.count]
    sorts: [users.created_month desc]
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${users.count}/offset(${users.count},1)\
          \ -1 ", value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    single_value_title: ''
    comparison_label: vs Last Month
    conditional_formatting: [{type: greater than, value: 1000, background_color: "#8fd43f",
        font_color: "#fdfff5", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    listen:
      Created Month: users.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 0
    width: 6
    height: 4
  - title: Avg Unit Price
    name: Avg Unit Price
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [order_items.created_month, order_items.average_sale_price]
    sorts: [order_items.created_month desc]
    limit: 1000
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${order_items.average_sale_price}/offset(${order_items.average_sale_price},1)\
          \ -1 ", value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#000000"
    comparison_label: vs Last Month
    conditional_formatting: [{type: greater than, value: 30, background_color: "#7CB342",
        font_color: "#fdfffc", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 3
    col: 18
    width: 6
    height: 4
  - title: Top Spenders 💵
    name: Top Spenders 💵
    model: thelook
    explore: ecomm_predict
    type: looker_grid
    fields: [users.name, users.email, order_items.total_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 10
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
    series_column_widths:
      users.name: 126
      users.email: 196
      order_items.total_sale_price: 190
    series_cell_visualizations:
      order_items.total_sale_price:
        is_active: true
        palette:
          palette_id: b77623f6-c652-b489-fb6d-21142e7af226
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#DB4437"
          - "#4285F4"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    custom_color_enabled: true
    custom_color: "#000000"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs Last Month
    defaults_version: 1
    series_types: {}
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 13
    col: 16
    width: 8
    height: 6
  - title: Best Sellers 🎽
    name: Best Sellers 🎽
    model: thelook
    explore: ecomm_predict
    type: looker_grid
    fields: [products.brand, products.item_name, products.count]
    sorts: [products.count desc]
    limit: 10
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", products.brand, products.item_name, products.count]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      products.count: 125
      products.item_name: 360
      products.brand: 208
    series_cell_visualizations:
      products.count:
        is_active: true
        palette:
          palette_id: af6ff122-5760-5a1e-4731-877e0d72883a
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#DB4437"
          - "#4285F4"
    series_types: {}
    defaults_version: 1
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 13
    col: 5
    width: 11
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "\n<div style=\"border-bottom: solid 1px #4285F4;\">\n\n<nav style=\"\
      font-size: 18px; padding: 5px 10px 0 10px; height: 60px\">\n\n  <a style=\"\
      padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4;\
      \ border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left;\
      \ line-height: 40px; font-weight: bold; background-color: #eaf1fe;\"  \n href=\"\
      /dashboards-next/thelook::cohort_analysis_overview\">Cohort Analysis</a>\n\n\
      \  <a style=\"padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left;\
      \ line-height: 40px;\" href=\"/dashboards-next/thelook::cluster_analysis_overview\"\
      >Cluster Analysis</a>\n\n  <a style=\"padding: 5px 15px; border-bottom: solid\
      \ 1px #4285F4; float: left; line-height: 40px;\" href=\"/dashboards-next/thelook::training_evaluation_overview\"\
      >\n\nTraining Evaluation</a>\n\n</nav>\n\n</div>"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: "#4 Brand"
    name: "#4 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 5
    column_limit: 50
    dynamic_fields: [{table_calculation: top_1, label: Top 1, expression: row() =
          4, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_1]
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 15
    col: 0
    width: 5
    height: 2
  - title: "#5 Brand"
    name: "#5 Brand"
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [products.brand, order_items.count]
    filters:
      ecomm_predict.centroid_id: ''
    sorts: [order_items.count desc]
    limit: 5
    column_limit: 50
    dynamic_fields: [{table_calculation: top_5, label: Top 5, expression: row() =
          5, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
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
    hidden_fields: [order_items.count]
    hidden_points_if_no: [top_2, top_5]
    listen:
      Created Month: order_items.created_month
      Cohorts: ecomm_predict.centroid_label
    row: 17
    col: 0
    width: 5
    height: 2
  - title: New Arrivals
    name: New Arrivals
    model: thelook
    explore: ecomm_predict
    type: looker_grid
    fields: [products.item_name, inventory_items.created_date, ecomm_predict.centroid_label]
    filters:
      order_items.created_month: 6 months ago for 6 months
    sorts: [inventory_items.created_date desc]
    limit: 10
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
    series_types: {}
    defaults_version: 1
    hidden_fields: [inventory_items.created_date]
    column_order: ["$$$_row_numbers_$$$", ecomm_predict.centroid_label, products.brand,
      products.item_name, products.category, products.count]
    series_column_widths:
      products.brand: 183
      products.category: 158
    listen:
      Cohorts: ecomm_predict.centroid_label
    row: 7
    col: 16
    width: 8
    height: 6
  filters:
  - name: Cohorts
    title: Cohorts
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: thelook
    explore: ecomm_predict
    listens_to_filters: []
    field: ecomm_predict.centroid_label
  - name: Created Month
    title: Created Month
    type: field_filter
    default_value: 2 month ago for 2 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: thelook
    explore: ecomm_predict
    listens_to_filters: []
    field: order_items.created_month
