#cluster analysis overview
- dashboard: cluster_analysis_overview
  title: Cluster Analysis Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Spending Behavior by Clusters
    name: Spending Behavior by Clusters
    model: thelook
    explore: kmeans_model5
    type: looker_grid
    fields: [kmeans_model5.feature, kmeans_model5.centroid_id, kmeans_model5.avg_qty]
    pivots: [kmeans_model5.feature]
    filters:
      kmeans_model5.feature: -"add_to_cart",-email,-"event_usage",-"avg_unit_price",-"avg_quantity_per_order",-"sock_avg_qty",-"maternity_avg_qty",-"leggings_avg_qty",-"jumpsuits_and_rompers_avg_qty",-"home_visits",-"clothing_sets_avg_qty",-purchases
    sorts: [kmeans_model5.feature, kmeans_model5.centroid_id]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns: {}
    column_order: [kmeans_model5.centroid_id, accessories_kmeans_model5.avg_qty, active_kmeans_model5.avg_qty,
      jeans_kmeans_model5.avg_qty, pants_kmeans_model5.avg_qty, shorts_kmeans_model5.avg_qty,
      skirts_kmeans_model5.avg_qty, sleepwear_kmeans_model5.avg_qty, sweaters_kmeans_model5.avg_qty,
      swim_kmeans_model5.avg_qty, tops_and_tees_kmeans_model5.avg_qty, underwear_kmeans_model5.avg_qty,
      capris_kmeans_model5.avg_qty, dresses_kmeans_model5.avg_qty, fashion_kmeans_model5.avg_qty,
      jackets_kmeans_model5.avg_qty, outerwear_kmeans_model5.avg_qty, cancel_kmeans_model5.avg_qty]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      kmeans_model5.numerical_value: 139
      kmeans_model5.centroid_id: 97
      kmeans_model5.avg_qty: 74
    series_cell_visualizations:
      kmeans_model5.numerical_value:
        is_active: false
    series_text_format:
      kmeans_model5.numerical_value:
        align: left
      kmeans_model5.avg_qty:
        align: left
    conditional_formatting: [{type: along a scale..., value: 30, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: faee8ca0-9727-fd3f-fa2c-0b2f94c103f3, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#DB4437", offset: 100}]},
          options: {steps: 100, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: number, value: 0.1}}, mirror: false, reverse: false,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: [
          kmeans_model5.avg_qty]}]
    series_value_format:
      kmeans_model5.numerical_value:
        name: decimal_2
        format_string: "#,##0.00"
        label: Decimals (2)
      kmeans_model5.avg_qty:
        name: decimal_2
        format_string: "#,##0.00"
        label: Decimals (2)
    defaults_version: 1
    listen: {}
    row: 12
    col: 0
    width: 24
    height: 6
  - title: "# of Customers Per Cluster"
    name: "# of Customers Per Cluster"
    model: thelook
    explore: ecomm_predict
    type: looker_bar
    fields: [ecomm_predict.centroid_id, ecomm_predict.count]
    sorts: [ecomm_predict.centroid_id]
    limit: 500
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: ecomm_predict.count,
            id: ecomm_predict.count, name: Num of Customers}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: log}]
    x_axis_label: Clusters
    size_by_field: ecomm_predict.count
    hide_legend: true
    series_types: {}
    series_colors:
      ecomm_predict.count: "#4285F4"
    series_labels:
      ecomm_predict.count: Num of Customers
    label_color: ["#0000ff"]
    show_null_points: true
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
    listen: {}
    row: 4
    col: 0
    width: 11
    height: 8
  - title: Orders vs Web Events
    name: Orders vs Web Events
    model: thelook
    explore: ecomm_predict
    type: looker_column
    fields: [ecomm_predict.centroid_id, ecomm_predict.event_usage, ecomm_predict.purchases]
    sorts: [ecomm_predict.centroid_id]
    limit: 500
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
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: ecomm_predict.purchases,
            id: ecomm_predict.purchases, name: 'Avg # of Orders'}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: log}, {label: !!null '', orientation: right, series: [{axisId: ecomm_predict.event_usage,
            id: ecomm_predict.event_usage, name: 'Avg # of Web Events'}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: log}]
    x_axis_label: Clusters
    size_by_field: ecomm_predict.count
    series_types:
      ecomm_predict.event_usage: line
    series_colors:
      ecomm_predict.event_usage: "#0F9D58"
      ecomm_predict.purchases: "#DB4437"
    series_labels:
      ecomm_predict.count: Num of Customers
    show_null_points: true
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
    interpolation: linear
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 4
    col: 11
    width: 13
    height: 8
  - title: 'Cluster #2'
    name: 'Cluster #2'
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [ecomm_predict.avg_unit_price]
    filters:
      ecomm_predict.centroid_id: '2'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    value_format: "$00.00"
    conditional_formatting: [{type: greater than, value: 30, background_color: "#98aee8",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
    series_types: {}
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
    show_null_points: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen: {}
    row: 2
    col: 8
    width: 4
    height: 2
  - title: 'Cluster #1'
    name: 'Cluster #1'
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [ecomm_predict.avg_unit_price]
    filters:
      ecomm_predict.centroid_id: '1'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    value_format: "$00.00"
    conditional_formatting: [{type: greater than, value: 40, background_color: "#518ce8",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
    series_types: {}
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
    show_null_points: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen: {}
    row: 2
    col: 4
    width: 4
    height: 2
  - title: 'Cluster #3'
    name: 'Cluster #3'
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [ecomm_predict.avg_unit_price]
    filters:
      ecomm_predict.centroid_id: '3'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    value_format: "$00.00"
    conditional_formatting: [{type: less than, value: 42, background_color: "#6d90e8",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
    series_types: {}
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
    show_null_points: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen: {}
    row: 2
    col: 12
    width: 4
    height: 2
  - title: 'Cluster #4'
    name: 'Cluster #4'
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [ecomm_predict.avg_unit_price]
    filters:
      ecomm_predict.centroid_id: '4'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    value_format: "$00.00"
    conditional_formatting: [{type: greater than, value: 50, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
    series_types: {}
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
    show_null_points: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen: {}
    row: 2
    col: 16
    width: 4
    height: 2
  - title: 'Cluster #5'
    name: 'Cluster #5'
    model: thelook
    explore: ecomm_predict
    type: single_value
    fields: [ecomm_predict.avg_unit_price]
    filters:
      ecomm_predict.centroid_id: '5'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    value_format: "$00.00"
    conditional_formatting: [{type: less than, value: 34, background_color: "#c1cde8",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
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
    defaults_version: 1
    series_types: {}
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
    show_null_points: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen: {}
    row: 2
    col: 20
    width: 4
    height: 2
  - name: Avg Unit Price by Cluster
    type: text
    title_text: Avg Unit Price by Cluster
    subtitle_text: ''
    body_text: ''
    row: 2
    col: 0
    width: 4
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |2-
      <div style="border-bottom: solid 1px #4285F4;">
      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">
        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards-next/thelook::cohort_analysis_overview">Cohort Analysis</a>
        <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;"  href="/dashboards-next/thelook::cluster_analysis_overview">Cluster Analysis</a>
        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards-next/thelook::training_evaluation_overview">
      Training Evaluation</a>
      </nav>
      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Age Distribution
    name: Age Distribution
    model: thelook
    explore: ecomm_predict
    type: looker_donut_multiples
    fields: [ecomm_predict.centroid_id, users.gender, users.count]
    pivots: [users.gender]
    sorts: [users.gender 0, ecomm_predict.centroid_id]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'concat("Cluster
          #", ${ecomm_predict.centroid_id})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
    show_value_labels: true
    font_size: 16
    charts_across: 5
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    series_colors:
      Female - users.count: "#4285F4"
      Male - users.count: "#F4B400"
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
    defaults_version: 1
    series_types: {}
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    value_labels: legend
    label_type: labPer
    interpolation: linear
    hidden_fields: [ecomm_predict.centroid_id]
    listen: {}
    row: 30
    col: 0
    width: 24
    height: 9
  - title: 'Age Distribution '
    name: 'Age Distribution '
    model: thelook
    explore: ecomm_predict
    type: looker_bar
    fields: [ecomm_predict.centroid_id, users.age_tier, users.count]
    pivots: [users.age_tier]
    sorts: [users.age_tier 0, ecomm_predict.centroid_id]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'concat("Cluster
          #", ${ecomm_predict.centroid_id})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: 10 to 19 - 02 - users.count,
            id: 10 to 19 - 02 - users.count, name: 10 to 19}, {axisId: 20 to 29 -
              03 - users.count, id: 20 to 29 - 03 - users.count, name: 20 to 29},
          {axisId: 30 to 39 - 04 - users.count, id: 30 to 39 - 04 - users.count, name: 30
              to 39}, {axisId: 40 to 49 - 05 - users.count, id: 40 to 49 - 05 - users.count,
            name: 40 to 49}, {axisId: 50 to 59 - 06 - users.count, id: 50 to 59 -
              06 - users.count, name: 50 to 59}, {axisId: 60 to 69 - 07 - users.count,
            id: 60 to 69 - 07 - users.count, name: 60 to 69}, {axisId: 70 or Above
              - 08 - users.count, id: 70 or Above - 08 - users.count, name: 70 or
              Above}], showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    trellis_rows: 3
    series_types: {}
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
    hidden_fields: [ecomm_predict.centroid_id]
    listen: {}
    row: 18
    col: 0
    width: 24
    height: 12
