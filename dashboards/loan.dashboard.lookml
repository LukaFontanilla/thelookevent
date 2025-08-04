---
- dashboard: loan_overview
  title: Loan Overview
  layout: newspaper
  preferred_viewer: dashboards
  description: ''
  preferred_slug: 4Gk2DISIrSCkAXXGMY1Z1m
  elements:
  - title: Total Balance in Accounts Yesterday
    name: Total Balance in Accounts Yesterday
    model: retail_banking
    explore: balances_fact
    type: single_value
    fields: [balances_fact.balance_yesterday, balances_fact.balance_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: $0.000,, "M"
    comparison_label: since beginning of time period
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
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: This is the total balance across all accounts as of yesterday, compared
      with the total balance across all accounts at the beginning of the time period
      specified in the filter
    hidden_pivots: {}
    listen: {}
    row: 2
    col: 0
    width: 6
    height: 4
  - title: Average Daily Balance
    name: Average Daily Balance
    model: retail_banking
    explore: balances_fact
    type: single_value
    fields: [balances_fact.average_daily_balance]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#B32F37"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: Average Daily Balance for This Period
    hidden_pivots: {}
    listen: {}
    row: 2
    col: 12
    width: 6
    height: 4
  - title: Inflow Rate
    name: Inflow Rate
    model: retail_banking
    explore: balances_fact
    type: single_value
    fields: [balances_fact.inflow_rate]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
    custom_color: "#08B248"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: Total inflow over balance at beginning of period
    listen: {}
    row: 2
    col: 6
    width: 6
    height: 4
  - title: Number of Clients
    name: Number of Clients
    model: retail_banking
    explore: trans
    type: single_value
    fields: [account.number_of_accounts]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 2
    col: 18
    width: 6
    height: 4
  - name: "<span class='fa fa-tachometer'> Loan Overview </span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Loan Overview </span>"
    subtitle_text: How are our accounts doing?
    body_text: "**Recommended action:** Drill into inflow rate to get a closer look\
      \ at high value accounts. Follow up with clients to schedule an investment meeting\
      \ or to let them know about new offerings"
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Inflow and Outflow Over Time
    name: Inflow and Outflow Over Time
    model: retail_banking
    explore: balances_fact
    type: looker_line
    fields: [balances_fact.balance_date, balances_fact.total_balance, trans.total_outflow,
      trans.total_inflow]
    filters:
      balances_fact.balance_date: 6 months
      account.account_id: ''
    sorts: [balances_fact.balance_date desc]
    limit: 500
    column_limit: 50
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
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: trans.total_outflow,
            id: trans.total_outflow, name: Total Outflow}, {axisId: trans.total_inflow,
            id: trans.total_inflow, name: Total Inflow}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: balances_fact.total_balance,
            id: balances_fact.total_balance, name: Total Balance}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_colors:
      trans.total_outflow: "#B32F37"
      trans.total_inflow: "#72D16D"
      balances_fact.total_balance: "#4276BE"
    series_point_styles:
      balances_fact.total_balance: diamond
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 6
    col: 0
    width: 24
    height: 7
  - name: "<span class='fa fa-bank'> Cross Selling</span>"
    type: text
    title_text: "<span class='fa fa-bank'> Cross Selling</span>"
    subtitle_text: What other products do our customers have?
    body_text: "**Recommended action:** Explore from here to see what clients may\
      \ benefit from automated outreach for cross-sell opportunities"
    row: 25
    col: 0
    width: 24
    height: 5
  - title: Outflows by Category
    name: Outflows by Category
    model: retail_banking
    explore: trans
    type: looker_column
    fields: [trans.total_transaction_value, trans.category, trans.number_of_transactions]
    filters:
      trans.type: Debit
      trans.total_transaction_value: ">0"
      trans.category: "-Interest Sanctioned"
    sorts: [trans.total_transaction_value desc]
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
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: trans.total_transaction_value,
            id: trans.total_transaction_value, name: Total Transaction Value}], showLabels: false,
        showValues: true, valueFormat: '$0.0,,, "B"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: trans.number_of_transactions, id: trans.number_of_transactions,
            name: Number of Transactions}], showLabels: false, showValues: true, valueFormat: '0,
          "K"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    font_size: '12'
    label_value_format: ''
    series_types:
      trans.number_of_transactions: line
    series_colors:
      trans.number_of_transactions: "#B32F37"
      trans.total_transaction_value: "#FBB555"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    listen: {}
    row: 17
    col: 0
    width: 7
    height: 8
  - title: Clients with Large Outflows this Period
    name: Clients with Large Outflows this Period
    model: retail_banking
    explore: balances_fact
    type: looker_grid
    fields: [account.account_id, account.create_date, balances_fact.balance_yesterday,
      trans.total_outflow]
    sorts: [trans.total_outflow desc]
    limit: 15
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
    show_totals: true
    show_row_totals: true
    series_labels:
      account.account_id: Account ID
      account.create_date: Client Since
      trans.total_outflow: Outflow this Period
      balances_fact.balance_yesterday: Current Balance
    series_cell_visualizations:
      trans.total_outflow:
        is_active: true
        palette:
          palette_id: b8082353-c148-8a21-077d-fafc86b1c081
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#E57947"
          - "#FBB555"
      balances_fact.balance_yesterday:
        is_active: true
        palette:
          palette_id: 4e438ce5-22c9-8333-bb3d-73afe7f95cfc
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#C2DD67"
          - "#72D16D"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 17
    col: 14
    width: 10
    height: 8
  - name: "<span class='fa fa-dollar'> Outflow </span>"
    type: text
    title_text: "<span class='fa fa-dollar'> Outflow </span>"
    subtitle_text: Why are customers withdrawing from accounts?
    body_text: "**Recommended action:** Investigate interest rates from other banks\
      \ and drill into the Account Dashboard to understand why clients are taking\
      \ money from their account"
    row: 13
    col: 0
    width: 24
    height: 4
  - title: Transfers to and from External Banks
    name: Transfers to and from External Banks
    model: retail_banking
    explore: trans
    type: looker_column
    fields: [trans.total_transaction_value, trans.bank, trans.type]
    pivots: [trans.type]
    filters:
      trans.operation: Collect from Bank,Remittance to Bank
      trans.bank: "-Internal"
    sorts: [trans.total_transaction_value desc 0, trans.type]
    limit: 500
    column_limit: 50
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Credit - trans.total_transaction_value,
            id: Credit - trans.total_transaction_value, name: Outflow}, {axisId: Debit
              - trans.total_transaction_value, id: Debit - trans.total_transaction_value,
            name: Inflow}], showLabels: false, showValues: true, valueFormat: '$0,,
          "M"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      Credit - trans.total_transaction_value: "#E57947"
      Debit - trans.total_transaction_value: "#72D16D"
    series_labels:
      Credit - trans.total_transaction_value: Outflow
      Debit - trans.total_transaction_value: Inflow
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen: {}
    row: 17
    col: 7
    width: 7
    height: 8
  - title: Age Days Between Signing Up for a Credit Card
    name: Age Days Between Signing Up for a Credit Card
    model: retail_banking
    explore: account
    type: looker_column
    fields: [card.average_days_between_account_signup, card.type, client.age_tier]
    pivots: [card.type]
    filters:
      card.type: -"Null"
      client.age_tier: "-Below 18"
    sorts: [card.average_days_between_account_signup desc 0, client.age_tier, card.type]
    limit: 500
    column_limit: 50
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
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: card.average_days_between_account_signup,
            id: Looker Junior - 0 - card.average_days_between_account_signup, name: Looker
              Junior}, {axisId: card.average_days_between_account_signup, id: Looker
              Emerald - 1 - card.average_days_between_account_signup, name: Looker
              Emerald}, {axisId: card.average_days_between_account_signup, id: Looker
              Ruby - 2 - card.average_days_between_account_signup, name: Looker Ruby},
          {axisId: card.average_days_between_account_signup, id: Looker Ruby Preferred
              - 3 - card.average_days_between_account_signup, name: Looker Ruby Preferred},
          {axisId: card.average_days_between_account_signup, id: Looker Business Reserve
              - 4 - card.average_days_between_account_signup, name: Looker Business
              Reserve}], showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors: {}
    defaults_version: 1
    listen: {}
    row: 37
    col: 0
    width: 11
    height: 8
  - name: ''
    type: text
    body_text: "<p>"
    row: 30
    col: 11
    width: 2
    height: 15
  - title: Average Daily Account Balance by Card Type
    name: Average Daily Account Balance by Card Type
    model: retail_banking
    explore: balances_fact
    type: looker_column
    fields: [balances_fact.average_daily_balance, card.type]
    pivots: [card.type]
    filters:
      card.type: -"Null"
    sorts: [card.type]
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
    legend_position: right
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
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: balances_fact.average_daily_balance,
            id: Looker Junior - 0 - balances_fact.average_daily_balance, name: Looker
              Junior}, {axisId: balances_fact.average_daily_balance, id: Looker Emerald
              - 1 - balances_fact.average_daily_balance, name: Looker Emerald}, {
            axisId: balances_fact.average_daily_balance, id: Looker Ruby - 2 - balances_fact.average_daily_balance,
            name: Looker Ruby}, {axisId: balances_fact.average_daily_balance, id: Looker
              Ruby Preferred - 3 - balances_fact.average_daily_balance, name: Looker
              Ruby Preferred}, {axisId: balances_fact.average_daily_balance, id: Looker
              Business Reserve - 4 - balances_fact.average_daily_balance, name: Looker
              Business Reserve}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    series_colors: {}
    defaults_version: 1
    listen: {}
    row: 32
    col: 4
    width: 7
    height: 5
  - title: Clients w/ Loans
    name: Clients w/ Loans
    model: retail_banking
    explore: account
    type: single_value
    fields: [loan.number_of_loans, client.percent_clients_with_loans]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: of Clients
    defaults_version: 1
    listen: {}
    row: 32
    col: 13
    width: 4
    height: 5
  - title: Clients w/ Cards
    name: Clients w/ Cards
    model: retail_banking
    explore: account
    type: single_value
    fields: [card.number_of_credit_cards, client.percent_clients_with_cards]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: of Clients
    defaults_version: 1
    listen: {}
    row: 32
    col: 0
    width: 4
    height: 5
  - name: Credit Cards
    type: text
    title_text: Credit Cards
    subtitle_text: ''
    body_text: "[Card Overview Dashboard](https://demoexpo.looker.com/dashboards/304)"
    row: 30
    col: 0
    width: 11
    height: 2
  - name: Loans
    type: text
    title_text: Loans
    row: 30
    col: 13
    width: 11
    height: 2
  - title: Average Days between Signing up for Loan
    name: Average Days between Signing up for Loan
    model: retail_banking
    explore: account
    type: looker_column
    fields: [loan.average_days_between_signup, client.age_tier]
    filters:
      client.age_tier: "-Below 18,-65 to 74,-75 or Above,-Undefined"
    sorts: [loan.average_days_between_signup desc]
    limit: 500
    column_limit: 50
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
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: loan.average_days_between_signup,
            id: loan.average_days_between_signup, name: Average Days Between Signup}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 32
    col: 17
    width: 7
    height: 5
  - title: Loan Status by Age Tier
    name: Loan Status by Age Tier
    model: retail_banking
    explore: account
    type: looker_donut_multiples
    fields: [client.age_tier, loan.status, loan.number_of_loans]
    pivots: [loan.status]
    filters:
      loan.status: "-Unknown"
      client.age_tier: "-Undefined"
    sorts: [client.age_tier, loan.status]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    series_colors:
      Running, OK - 2 - loan.number_of_loans: "#FFD95F"
      Running, In Debt - 3 - loan.number_of_loans: "#E57947"
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 37
    col: 13
    width: 11
    height: 8
