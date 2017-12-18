- dashboard: ecommerce_dashboard
  title: eCommerce Dashboard
  layout: newspaper
  elements:

  - title: Total Orders
    name: Total Orders
    model: ecommerce
    explore: orders
    type: single_value
    fields:
    - orders.count
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Total Orders
    row: 0
    col: 0
    width: 6
    height: 3

  - title: Total Customers
    name: Total Customers
    model: ecommerce
    explore: customers
    type: single_value
    fields:
    - customers.count
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    series_types: {}
    single_value_title: Total Customers
    row: 0
    col: 12
    width: 6
    height: 3

  - title: Total Revenue
    name: Total Revenue
    model: ecommerce
    explore: orders
    type: single_value
    fields:
    - orders.total_revenue
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    series_types: {}
    single_value_title: Total Revenue
    row: 0
    col: 6
    width: 6
    height: 3

  - title: Avg Order Value
    name: Avg Order Value
    model: ecommerce
    explore: orders
    type: single_value
    fields:
    - orders.avg_order_value
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    series_types: {}
    single_value_title: Avg Order Value
    row: 0
    col: 18
    width: 6
    height: 3

  - title: Orders by Order Date
    name: Orders by Order Date
    model: ecommerce
    explore: orders
    type: looker_line
    fields:
    - orders.count
    - orders.created_month
    fill_fields:
    - orders.created_month
    sorts:
    - orders.created_month desc
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    y_axes:
    - label: Orders
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: orders.count
        name: Orders
        axisId: orders.count
    x_axis_label: Order Date
    hide_legend: true
    x_axis_datetime_tick_count: 6
    row: 3
    col: 0
    width: 6
    height: 6

  - title: Revenue by Order Date
    name: Revenue by Order Date
    model: ecommerce
    explore: orders
    type: looker_line
    fields:
    - orders.total_revenue
    - orders.created_month
    fill_fields:
    - orders.created_month
    sorts:
    - orders.created_month desc
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    y_axes:
    - label: Total Revenue
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: orders.total_revenue
        name: Total Revenue
        axisId: orders.total_revenue
    x_axis_label: Order Date
    hide_legend: true
    x_axis_datetime_tick_count: 6
    row: 3
    col: 6
    width: 6
    height: 6

  - title: Customer Retention by Cohort
    name: Customer Retention by Cohort
    model: ecommerce
    explore: orders
    type: table
    fields:
    - orders.customers_count
    - orders.months_from_start
    - orders.customer_first_order_month
    pivots:
    - orders.months_from_start
    filters:
      orders.months_from_start: NOT NULL
    sorts:
    - orders.months_from_start 0
    - orders.customer_first_order_month
    limit: 500
    dynamic_fields:
    - table_calculation: cohort_customers
      label: Cohort Customers
      expression: pivot_offset(${orders.customers_count}, ${orders.months_from_start}
        * -1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: retention_rate
      label: Retention Rate
      expression: "${orders.customers_count} / ${cohort_customers}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - orders.customers_count
    - cohort_customers
    row: 15
    col: 0
    width: 24
    height: 11

  - title: Customer Retention by Cohort Trends
    name: Customer Retention by Cohort Trends
    model: ecommerce
    explore: orders
    type: looker_line
    fields:
    - orders.customers_count
    - orders.months_from_start
    - orders.customer_first_order_month
    pivots:
    - orders.customer_first_order_month
    filters:
      orders.months_from_start: NOT NULL
    sorts:
    - orders.months_from_start 0
    - orders.customer_first_order_month
    limit: 500
    dynamic_fields:
    - table_calculation: cohort_customers
      label: Cohort Customers
      expression: offset(${orders.customers_count}, ${orders.months_from_start} *
        -1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: retention_rate
      label: Retention Rate
      expression: "${orders.customers_count} / ${cohort_customers}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - orders.customers_count
    - cohort_customers
    series_types: {}
    x_axis_datetime_tick_count: 6
    x_axis_label: Months from Start
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: '2016-07-01'
        name: '2016-07-01'
        axisId: retention_rate
      - id: '2016-08-01'
        name: '2016-08-01'
        axisId: retention_rate
      - id: '2016-09-01'
        name: '2016-09-01'
        axisId: retention_rate
      - id: '2016-10-01'
        name: '2016-10-01'
        axisId: retention_rate
      - id: '2016-11-01'
        name: '2016-11-01'
        axisId: retention_rate
      - id: '2016-12-01'
        name: '2016-12-01'
        axisId: retention_rate
      - id: '2017-01-01'
        name: '2017-01-01'
        axisId: retention_rate
      - id: '2017-02-01'
        name: '2017-02-01'
        axisId: retention_rate
      - id: '2017-03-01'
        name: '2017-03-01'
        axisId: retention_rate
      - id: '2017-04-01'
        name: '2017-04-01'
        axisId: retention_rate
      - id: '2017-05-01'
        name: '2017-05-01'
        axisId: retention_rate
      - id: '2017-06-01'
        name: '2017-06-01'
        axisId: retention_rate
      - id: '2017-07-01'
        name: '2017-07-01'
        axisId: retention_rate
      - id: '2017-08-01'
        name: '2017-08-01'
        axisId: retention_rate
      - id: '2017-09-01'
        name: '2017-09-01'
        axisId: retention_rate
      - id: '2017-10-01'
        name: '2017-10-01'
        axisId: retention_rate
      - id: '2017-11-01'
        name: '2017-11-01'
        axisId: retention_rate
    row: 26
    col: 0
    width: 24
    height: 6

  - title: Cohort Sizes
    name: Cohort Sizes
    model: ecommerce
    explore: orders
    type: looker_column
    fields:
    - customers.first_order_month
    - customers.count
    fill_fields:
    - customers.first_order_month
    filters:
      orders.customer_first_order_month: "-NULL"
    sorts:
    - customers.first_order_month desc
    limit: 500
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: time
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: custom
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: customers.count
        name: Customers Count
        axisId: customers.count
    x_axis_datetime_tick_count: 6
    row: 9
    col: 0
    width: 12
    height: 6

  - title: Avg Order Value by Order Date
    name: Avg Order Value by Order Date
    model: ecommerce
    explore: orders
    type: looker_line
    fields:
    - orders.created_month
    - orders.avg_order_value
    fill_fields:
    - orders.created_month
    sorts:
    - orders.created_month desc
    limit: 500
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: []
    x_axis_datetime_tick_count: 6
    x_axis_label: Processed Month
    y_axes:
    - label: Avg Order Value
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: custom
      tickDensityCustom: '7'
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: orders.avg_order_value
        name: Orders Avg Order Value
        axisId: orders.avg_order_value
    row: 3
    col: 18
    width: 6
    height: 6

  - title: New vs Repeat Revenue by Order Date
    name: New vs Repeat Revenue by Order Date
    model: ecommerce
    explore: orders
    type: looker_column
    fields:
    - orders.created_month
    - orders.total_revenue
    - orders.new_vs_repeat
    pivots:
    - orders.new_vs_repeat
    fill_fields:
    - orders.created_month
    sorts:
    - orders.created_month desc
    - orders.new_vs_repeat
    limit: 500
    stacking: percent
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_series:
    - new - Orders Total Revenue
    - repeat - Orders Total Revenue
    hidden_fields:
    x_axis_datetime_tick_count: 6
    series_labels:
      pct_repeat: Repeat
      pct_new: New
    column_group_spacing_ratio:
    column_spacing_ratio:
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: new
        name: new
        axisId: orders.total_revenue
      - id: repeat
        name: repeat
        axisId: orders.total_revenue
    row: 9
    col: 12
    width: 12
    height: 6

  - title: Customers by Order Date
    name: Customers by Order Date
    model: ecommerce
    explore: orders
    type: looker_line
    fields:
    - orders.customers_count
    - orders.created_month
    - orders.new_vs_repeat
    pivots:
    - orders.new_vs_repeat
    fill_fields:
    - orders.created_month
    sorts:
    - orders.created_month desc
    - orders.new_vs_repeat
    limit: 500
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    x_axis_datetime_tick_count: 6
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: new
        name: new
        axisId: orders.customers_count
      - id: repeat
        name: repeat
        axisId: orders.customers_count
    row: 3
    col: 12
    width: 6
    height: 6

  - title: Top Products
    name: Top Products
    model: ecommerce
    explore: order_items
    type: table
    fields:
    - products.title
    - order_items.count
    - order_items.total_revenue
    - order_items.price
    sorts:
    - order_items.total_revenue desc 0
    - order_items.count desc
    limit: 100
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    y_axes:
    - label: Order Items
      maxValue:
      minValue:
      orientation: bottom
      showLabels: true
      showValues: true
      tickDensity: custom
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: order_items.count
        name: Order Items Count
        axisId: order_items.count
    series_labels:
      products.title: Product Name
      order_items.count: Units Ordered
      order_items.total_revenue: Total Revenue
      order_items.price: Price
    row: 48
    col: 0
    width: 24
    height: 14

  - title: Cumulative LTR
    name: Cumulative LTR
    model: ecommerce
    explore: orders
    type: looker_line
    fields:
    - orders.months_from_start
    - orders.total_revenue
    - orders.customers_count
    sorts:
    - orders.months_from_start
    limit: 500
    dynamic_fields:
    - table_calculation: cumulative_total_revenue
      label: Cumulative Total Revenue
      expression: running_total(${orders.total_revenue})
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cohort_size
      label: Cohort Size
      expression: offset(${orders.customers_count}, -1 * (row() - 1) )
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: ltr
      label: LTR
      expression: "${cumulative_total_revenue} / ${cohort_size}"
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    hidden_fields:
    - orders.total_revenue
    - orders.customers_count
    - cumulative_total_revenue
    - cohort_size
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ltr
        name: LTR
        axisId: ltr
    row: 32
    col: 0
    width: 12
    height: 8

  - title: Cumulative Lifetime Order Count
    name: Cumulative Lifetime Order Count
    model: ecommerce
    explore: orders
    type: looker_line
    fields:
    - orders.months_from_start
    - orders.count
    - orders.customers_count
    sorts:
    - orders.months_from_start
    limit: 500
    dynamic_fields:
    - table_calculation: cumulative_total_orders
      label: Cumulative Total Orders
      expression: running_total(${orders.count})
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cohort_size
      label: Cohort Size
      expression: offset(${orders.customers_count}, -1 * (row() - 1) )
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: ltr
      label: LTR
      expression: "${cumulative_total_orders} / ${cohort_size}"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    hidden_fields:
    - orders.customers_count
    - cumulative_total_revenue
    - cohort_size
    - orders.count
    - cumulative_total_orders
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: ltr
        name: LTR
        axisId: ltr
    row: 40
    col: 0
    width: 12
    height: 8

  - title: Lifetime Order Count by Cohort
    name: Lifetime Order Count by Cohort
    model: ecommerce
    explore: orders
    type: looker_line
    fields:
    - orders.months_from_start
    - orders.count
    - orders.customers_count
    - orders.customer_first_order_month
    pivots:
    - orders.customer_first_order_month
    filters:
      orders.customer_first_order_month: "-NULL"
    sorts:
    - orders.months_from_start
    - orders.customer_first_order_month
    limit: 500
    dynamic_fields:
    - table_calculation: cumulative_total_orders
      label: Cumulative Total Orders
      expression: running_total(${orders.count})
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cohort_size
      label: Cohort Size
      expression: offset(${orders.customers_count}, -1 * (row() - 1) )
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: ltr
      label: LTR
      expression: "${cumulative_total_orders} / ${cohort_size}"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    hidden_fields:
    - orders.customers_count
    - cumulative_total_revenue
    - cohort_size
    - orders.count
    - cumulative_total_orders
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: '2016-07-01'
        name: '2016-07-01'
        axisId: ltr
      - id: '2016-08-01'
        name: '2016-08-01'
        axisId: ltr
      - id: '2016-09-01'
        name: '2016-09-01'
        axisId: ltr
      - id: '2016-10-01'
        name: '2016-10-01'
        axisId: ltr
      - id: '2016-11-01'
        name: '2016-11-01'
        axisId: ltr
      - id: '2016-12-01'
        name: '2016-12-01'
        axisId: ltr
      - id: '2017-01-01'
        name: '2017-01-01'
        axisId: ltr
      - id: '2017-02-01'
        name: '2017-02-01'
        axisId: ltr
      - id: '2017-03-01'
        name: '2017-03-01'
        axisId: ltr
      - id: '2017-04-01'
        name: '2017-04-01'
        axisId: ltr
      - id: '2017-05-01'
        name: '2017-05-01'
        axisId: ltr
      - id: '2017-06-01'
        name: '2017-06-01'
        axisId: ltr
      - id: '2017-07-01'
        name: '2017-07-01'
        axisId: ltr
      - id: '2017-08-01'
        name: '2017-08-01'
        axisId: ltr
      - id: '2017-09-01'
        name: '2017-09-01'
        axisId: ltr
      - id: '2017-10-01'
        name: '2017-10-01'
        axisId: ltr
      - id: '2017-11-01'
        name: '2017-11-01'
        axisId: ltr
      - id: "∅"
        name: "∅"
        axisId: ltr
    row: 40
    col: 12
    width: 12
    height: 8

  - title: LTR by Cohort
    name: LTR by Cohort
    model: ecommerce
    explore: orders
    type: looker_line
    fields:
    - orders.months_from_start
    - orders.total_revenue
    - orders.customers_count
    - orders.customer_first_order_month
    pivots:
    - orders.customer_first_order_month
    filters:
      orders.customer_first_order_month: "-NULL"
    sorts:
    - orders.months_from_start
    - orders.customer_first_order_month
    limit: 500
    dynamic_fields:
    - table_calculation: cumulative_total_revenue
      label: Cumulative Total Revenue
      expression: running_total(${orders.total_revenue})
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cohort_size
      label: Cohort Size
      expression: offset(${orders.customers_count}, -1 * (row() - 1) )
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: ltr
      label: LTR
      expression: "${cumulative_total_revenue} / ${cohort_size}"
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    hidden_fields:
    - orders.total_revenue
    - orders.customers_count
    - cumulative_total_revenue
    - cohort_size
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: '2016-07-01'
        name: '2016-07-01'
        axisId: ltr
      - id: '2016-08-01'
        name: '2016-08-01'
        axisId: ltr
      - id: '2016-09-01'
        name: '2016-09-01'
        axisId: ltr
      - id: '2016-10-01'
        name: '2016-10-01'
        axisId: ltr
      - id: '2016-11-01'
        name: '2016-11-01'
        axisId: ltr
      - id: '2016-12-01'
        name: '2016-12-01'
        axisId: ltr
      - id: '2017-01-01'
        name: '2017-01-01'
        axisId: ltr
      - id: '2017-02-01'
        name: '2017-02-01'
        axisId: ltr
      - id: '2017-03-01'
        name: '2017-03-01'
        axisId: ltr
      - id: '2017-04-01'
        name: '2017-04-01'
        axisId: ltr
      - id: '2017-05-01'
        name: '2017-05-01'
        axisId: ltr
      - id: '2017-06-01'
        name: '2017-06-01'
        axisId: ltr
      - id: '2017-07-01'
        name: '2017-07-01'
        axisId: ltr
      - id: '2017-08-01'
        name: '2017-08-01'
        axisId: ltr
      - id: '2017-09-01'
        name: '2017-09-01'
        axisId: ltr
      - id: '2017-10-01'
        name: '2017-10-01'
        axisId: ltr
      - id: '2017-11-01'
        name: '2017-11-01'
        axisId: ltr
    row: 32
    col: 12
    width: 12
    height: 8
