- dashboard: ecommerce_dashboard
  title: eCommerce Dashboard
  layout: newspaper
  elements:
  
  - title: Average First 30-day LTR
    name: Average First 30-day LTR
    model: analytics
    explore: orders
    type: single_value
    fields:
    - customers.average_30_day_lifetime_revenue
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average First 30-day LTR
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    row: 31
    col: 0
    width: 8
    height: 2
    
  - title: Average First 60-day LTR
    name: Average First 60-day LTR
    model: analytics
    explore: orders
    type: single_value
    fields:
    - customers.average_60_day_lifetime_revenue
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average First 60-day LTR
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    row: 31
    col: 8
    width: 8
    height: 2
    
  - title: Average First 90-day LTR
    name: Average First 90-day LTR
    model: analytics
    explore: orders
    type: single_value
    fields:
    - customers.average_90_day_lifetime_revenue
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average First 90-day LTR
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    row: 31
    col: 16
    width: 8
    height: 2
    
  - title: Items Sold
    name: Items Sold
    model: analytics
    explore: orders
    type: single_value
    fields:
    - order_items.items_sold
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Items Sold
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    row: 14
    col: 0
    width: 8
    height: 2
    
  - title: Items Sold by Month
    name: Items Sold by Month
    model: analytics
    explore: orders
    type: looker_line
    fields:
    - order_items.items_sold
    - orders.created_month
    fill_fields:
    - orders.created_month
    sorts:
    - orders.created_month desc
    limit: 500
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: order_items.items_sold
        name: Items Sold
        axisId: order_items.items_sold
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Items Sold
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    row: 16
    col: 0
    width: 8
    height: 6
    
  - title: Average Days between 1st and 2nd Order
    name: Average Days between 1st and 2nd Order
    model: analytics
    explore: orders
    type: single_value
    fields:
    - orders.average_days_between_orders
    - orders.completed_order_number
    sorts:
    - orders.average_days_between_orders desc
    limit: 500
    filter_expression: "${orders.completed_order_number} = 2"
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average Days between 1st and 2nd Order
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
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: order_items.items_sold
        name: Items Sold
        axisId: order_items.items_sold
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    row: 14
    col: 8
    width: 8
    height: 2
    
  - title: Average Days Between Orders
    name: Average Days Between Orders
    model: analytics
    explore: orders
    type: looker_column
    fields:
    - orders.average_days_between_orders
    - orders.completed_order_number
    sorts:
    - orders.completed_order_number
    limit: 500
    filter_expression: "${orders.completed_order_number} > 1 AND ${orders.completed_order_number}\
      \ <= 12"
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average Days between 1st and 2nd Order
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
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: order_items.items_sold
        name: Items Sold
        axisId: order_items.items_sold
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    row: 16
    col: 8
    width: 8
    height: 6
    
  - title: Average Items per Order
    name: Average Items per Order
    model: analytics
    explore: orders
    type: single_value
    fields:
    - order_items.items_sold
    - orders.orders_count
    limit: 500
    dynamic_fields:
    - table_calculation: average_items_per_order
      label: Average Items per Order
      expression: "${order_items.items_sold} / ${orders.orders_count}"
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average Items per Order
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    - orders.orders_count
    - order_items.items_sold
    series_types: {}
    row: 14
    col: 16
    width: 8
    height: 2
    
  - title: Average Items per Order
    name: Average Items per Order
    model: analytics
    explore: orders
    type: looker_line
    fields:
    - order_items.items_sold
    - orders.orders_count
    - orders.created_month
    fill_fields:
    - orders.created_month
    sorts:
    - orders.created_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: average_items_per_order
      label: Average Items per Order
      expression: "${order_items.items_sold} / ${orders.orders_count}"
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: average_items_per_order
        name: Average Items per Order
        axisId: average_items_per_order
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average Items per Order
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    - orders.orders_count
    - order_items.items_sold
    row: 16
    col: 16
    width: 8
    height: 6
    
  - title: Average Lifetime Orders
    name: Average Lifetime Orders
    model: analytics
    explore: orders
    type: single_value
    fields:
    - customers.average_lifetime_completed_orders
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average Lifetime Orders
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    row: 22
    col: 0
    width: 12
    height: 2
    
  - title: Average Customer Lifetime Revenue
    name: Average Customer Lifetime Revenue
    model: analytics
    explore: orders
    type: single_value
    fields:
    - customers.average_lifetime_revenue
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average Customer Lifetime Revenue
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
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: customers.average_lifetime_completed_orders
        name: Average Lifetime Completed Orders
        axisId: customers.average_lifetime_completed_orders
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 22
    col: 12
    width: 12
    height: 2
    
  - title: Average Customer Lifetime Revenue
    name: Average Customer Lifetime Revenue
    model: analytics
    explore: orders
    type: looker_column
    fields:
    - customers.average_lifetime_revenue
    - orders.created_month
    fill_fields:
    - orders.created_month
    sorts:
    - orders.created_month desc
    limit: 500
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: customers.average_lifetime_revenue
        name: Average Lifetime Revenue
        axisId: customers.average_lifetime_revenue
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average Customer Lifetime Revenue
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 24
    col: 12
    width: 12
    height: 7
    
  - title: Average Lifetime Orders
    name: Average Lifetime Orders
    model: analytics
    explore: orders
    type: looker_column
    fields:
    - customers.average_lifetime_completed_orders
    - orders.created_month
    fill_fields:
    - orders.created_month
    sorts:
    - orders.created_month desc
    limit: 500
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: customers.average_lifetime_completed_orders
        name: Average Lifetime Completed Orders
        axisId: customers.average_lifetime_completed_orders
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average Lifetime Orders
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    row: 24
    col: 0
    width: 12
    height: 7
    
  - title: Distinct Buyers
    name: Distinct Buyers
    model: analytics
    explore: orders
    type: single_value
    fields:
    - orders.distinct_buyers
    limit: 500
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Distinct Buyers
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
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: new - orders.distinct_buyers
        name: new
        axisId: orders.distinct_buyers
      - id: repeat - orders.distinct_buyers
        name: repeat
        axisId: orders.distinct_buyers
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_tick_count: 6
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 0
    col: 12
    width: 6
    height: 2
    
  - title: Avg Order Value
    name: Avg Order Value
    model: analytics
    explore: orders
    type: single_value
    fields:
    - orders.average_order_value
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
    listen: {}
    row: 0
    col: 18
    width: 6
    height: 2
    
  - title: Total Orders
    name: Total Orders
    model: analytics
    explore: orders
    type: single_value
    fields:
    - orders.orders_count
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Total Orders
    listen: {}
    row: 0
    col: 0
    width: 6
    height: 2
    
  - title: Total Revenue
    name: Total Revenue
    model: analytics
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
    listen: {}
    row: 0
    col: 6
    width: 6
    height: 2
    
  - title: Orders by Order Date
    name: Orders by Order Date
    model: analytics
    explore: orders
    type: looker_line
    fields:
    - orders.orders_count
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
    listen: {}
    row: 2
    col: 0
    width: 6
    height: 6
    
  - title: Revenue by Order Date
    name: Revenue by Order Date
    model: analytics
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
    listen: {}
    row: 2
    col: 6
    width: 6
    height: 6
    
  - title: Avg Order Value by Order Date
    name: Avg Order Value by Order Date
    model: analytics
    explore: orders
    type: looker_line
    fields:
    - orders.created_month
    - orders.average_order_value
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
      - id: orders.average_order_value
        name: Orders Avg Order Value
        axisId: orders.average_order_value
    listen: {}
    row: 2
    col: 18
    width: 6
    height: 6
    
  - title: Buyers by Order Date
    name: Buyers by Order Date
    model: analytics
    explore: orders
    type: looker_line
    fields:
    - orders.distinct_buyers
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
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: new - orders.distinct_buyers
        name: new
        axisId: orders.distinct_buyers
      - id: repeat - orders.distinct_buyers
        name: repeat
        axisId: orders.distinct_buyers
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_tick_count: 6
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 2
    col: 12
    width: 6
    height: 6
    
  - title: Top Products
    name: Top Products
    model: analytics
    explore: orders
    type: table
    fields:
    - order_items.product_title
    - order_items.price
    - order_items.items_sold
    - order_items.total_revenue
    sorts:
    - order_items.total_revenue desc 0
    - order_items.items_sold desc
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
      - id: order_items.items_sold
        name: Order Items Count
        axisId: order_items.items_sold
    series_labels:
      products.title: Product Name
      order_items.count: Units Ordered
      order_items.total_revenue: Total Revenue
      order_items.price: Price
    listen: {}
    row: 33
    col: 0
    width: 24
    height: 14
    
  - title: New vs. Repeat Customers by Order Month
    name: New vs. Repeat Customers by Order Month
    model: analytics
    explore: orders
    type: looker_column
    fields:
    - orders.new_vs_repeat
    - orders.created_month
    - orders.distinct_buyers
    pivots:
    - orders.new_vs_repeat
    fill_fields:
    - orders.created_month
    sorts:
    - orders.created_month desc
    - orders.new_vs_repeat
    limit: 500
    query_timezone: America/New_York
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: new - orders.distinct_buyers
        name: new
        axisId: new - orders.distinct_buyers
      - id: repeat - orders.distinct_buyers
        name: repeat
        axisId: repeat - orders.distinct_buyers
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 8
    col: 0
    width: 12
    height: 6
    
  - title: New vs Repeat Revenue by Order Date
    name: New vs Repeat Revenue by Order Date
    model: analytics
    explore: orders
    type: looker_column
    fields:
    - orders.new_vs_repeat
    - order_items.total_revenue
    - orders.created_month
    pivots:
    - orders.new_vs_repeat
    fill_fields:
    - orders.created_month
    sorts:
    - orders.new_vs_repeat
    - orders.created_month desc
    limit: 500
    query_timezone: America/New_York
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: new - order_items.total_revenue
        name: new
        axisId: new - order_items.total_revenue
      - id: repeat - order_items.total_revenue
        name: repeat
        axisId: repeat - order_items.total_revenue
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 8
    col: 12
    width: 12
    height: 6
