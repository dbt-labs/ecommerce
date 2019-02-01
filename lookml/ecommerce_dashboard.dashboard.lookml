- dashboard: ecommerce_dashboard
  title: eCommerce Dashboard
  layout: newspaper
  elements:

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
    row: 0
    col: 0
    width: 6
    height: 3

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
    row: 0
    col: 6
    width: 6
    height: 3

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
    row: 0
    col: 18
    width: 6
    height: 3

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
    row: 3
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
    row: 3
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
    row: 3
    col: 18
    width: 6
    height: 6

  - title: New vs Repeat Revenue by Order Date
    name: New vs Repeat Revenue by Order Date
    model: analytics
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
    row: 48
    col: 0
    width: 24
    height: 14