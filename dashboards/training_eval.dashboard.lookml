#training evaluation overview
- dashboard: training_evaluation_overview
  title: Training Evaluation Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  elements:
  - title: Cluster Size by Iteration
    name: Cluster Size by Iteration
    model: thelook
    explore: ecomm_training_info
    type: looker_bar
    fields: [ecomm_training_info.iteration, cluster_info.centroid_id, cluster_info.cluster_size]
    pivots: [cluster_info.centroid_id]
    sorts: [ecomm_training_info.iteration, cluster_info.centroid_id]
    limit: 500
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
    label_value_format: "##.##\\%"
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 14
    col: 12
    width: 12
    height: 7
  - title: Loss By Iteration
    name: Loss By Iteration
    model: thelook
    explore: ecomm_training_info
    type: looker_area
    fields: [ecomm_training_info.loss, ecomm_training_info.iteration]
    sorts: [ecomm_training_info.iteration]
    limit: 500
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: ecomm_training_info.loss,
            id: ecomm_training_info.loss, name: Loss}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    label_value_format: "##.##\\%"
    series_types: {}
    series_point_styles: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen: {}
    row: 8
    col: 12
    width: 12
    height: 6
  - title: Number of Clusters Performance
    name: Number of Clusters Performance
    model: thelook
    explore: ecomm_training_info
    type: looker_line
    fields: [ecomm_model_eval.davies_bouldin_index, ecomm_model_eval.clusters_num]
    sorts: [ecomm_model_eval.clusters_num]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: ecomm_model_eval.davies_bouldin_index,
            id: ecomm_model_eval.davies_bouldin_index, name: Davies Bouldin Index}],
        showLabels: true, showValues: true, minValue: 2.15, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: log}]
    size_by_field: ''
    series_types: {}
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 2
    col: 5
    width: 19
    height: 6
  - title: Feature Info
    name: Feature Info
    model: thelook
    explore: ecomm_training_info
    type: looker_grid
    fields: [ecomm_feature_info.input, ecomm_feature_info.min, ecomm_feature_info.max,
      ecomm_feature_info.mean, ecomm_feature_info.stddev, ecomm_feature_info.null_count]
    filters:
      ecomm_feature_info.input: -email,-"add_to_cart"
    sorts: [ecomm_feature_info.min]
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
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_text_format:
      ecomm_feature_info.input:
        align: left
      ecomm_feature_info.min:
        align: center
      ecomm_feature_info.max:
        align: center
      ecomm_feature_info.mean:
        align: center
      ecomm_feature_info.null_count:
        align: center
      ecomm_feature_info.stddev:
        align: center
    header_font_color: "#1A73E8"
    header_background_color: ''
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 167db762-c0fb-28f3-1f2a-c1938b387aa9, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#e64c3b", offset: 100}]},
          options: {steps: 100, constraints: {min: {type: number, value: 0}, mid: {
                type: average}, max: {type: percentile, value: 70}}, mirror: false,
            reverse: false, stepped: true}}, bold: false, italic: false, strikethrough: false,
        fields: [ecomm_feature_info.mean, ecomm_feature_info.min, ecomm_feature_info.max,
          ecomm_feature_info.stddev]}]
    series_value_format:
      ecomm_feature_info.mean:
        name: decimal_2
        format_string: "#,##0.00"
        label: Decimals (2)
      ecomm_feature_info.stddev:
        name: decimal_2
        format_string: "#,##0.00"
        label: Decimals (2)
      ecomm_feature_info.min:
        name: decimal_2
        format_string: "#,##0.00"
        label: Decimals (2)
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
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 8
    col: 0
    width: 12
    height: 13
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |2-

      <div style="border-bottom: solid 1px #4285F4;">

      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards-next/thelook::cohort_analysis_overview">Cohort Analysis</a>

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="/dashboards-next/thelook::cluster_analysis_overview">Cluster Analysis</a>

        <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" href="/dashboards-next/thelook::training_evaluation_overview">

      Training Evaluation</a>




      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Clusters
    name: Clusters
    model: thelook
    explore: ecomm_training_info
    type: looker_grid
    fields: [ecomm_model_eval.clusters_num]
    sorts: [ecomm_model_eval.clusters_num]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_text_format:
      ecomm_model_eval.clusters_num:
        align: center
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 2
    col: 0
    width: 5
    height: 6
