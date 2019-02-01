- dashboard: cohort_analysis
  title: Cohort Analysis
  layout: newspaper

  elements:
  - title: Cohort Sizes
    name: Cohort Sizes
    model: analytics
    explore: orders
    type: looker_column
    fields:
    - orders.distinct_buyers
    - orders.first_completed_order_month
    fill_fields:
    - orders.first_completed_order_month
    filters:
      orders.is_completed: '1'
    sorts:
    - orders.first_completed_order_month desc
    limit: 500
    column_limit: 50
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
      - id: orders.customers_count
        name: Orders Customers Count
        axisId: orders.customers_count
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 1149
      __FILE: analytics/ecommerce_dashboard.dashboard.lookml
      __LINE_NUM: 1137
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_tick_count: 6
    x_axis_scale: time
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    row: 0
    col: 0
    width: 24
    height: 6
    
  - title: Cumulative Average Order Count by Cohort
    name: Cumulative Average Order Count by Cohort
    model: analytics
    explore: orders
    type: looker_line
    fields:
    - orders.months_from_first_completed_order
    - orders.orders_count
    - orders.first_order_month
    - orders.distinct_buyers
    pivots:
    - orders.first_order_month
    fill_fields:
    - orders.first_order_month
    filters:
      orders.is_completed: '1'
    sorts:
    - orders.months_from_first_completed_order
    - orders.first_order_month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: cumulative_total_orders
      label: Cumulative Total Orders
      expression: running_total(${orders.orders_count})
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cohort_size
      label: Cohort Size
      expression: offset(${orders.distinct_buyers}, -1 * (row() - 1) )
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
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
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
      - id: 2016-07
        name: 2016-07
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 947
      - id: 2016-08
        name: 2016-08
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 950
      - id: 2016-09
        name: 2016-09
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 953
      - id: 2016-10
        name: 2016-10
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 956
      - id: 2016-11
        name: 2016-11
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 959
      - id: 2016-12
        name: 2016-12
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 962
      - id: 2017-01
        name: 2017-01
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 965
      - id: 2017-02
        name: 2017-02
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 968
      - id: 2017-03
        name: 2017-03
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 971
      - id: 2017-04
        name: 2017-04
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 974
      - id: 2017-05
        name: 2017-05
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 977
      - id: 2017-06
        name: 2017-06
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 980
      - id: 2017-07
        name: 2017-07
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 983
      - id: 2017-08
        name: 2017-08
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 986
      - id: 2017-09
        name: 2017-09
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 989
      - id: 2017-10
        name: 2017-10
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 992
      - id: 2017-11
        name: 2017-11
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 995
      __FILE: analytics/ecommerce_dashboard.dashboard.lookml
      __LINE_NUM: 935
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
    show_null_points: false
    interpolation: linear
    hidden_fields:
    - orders.customers_count
    - cumulative_total_revenue
    - cohort_size
    - orders.orders_count
    - cumulative_total_orders
    - orders.distinct_buyers
    row: 20
    col: 0
    width: 12
    height: 6
    
  - title: Cumulative Average Revenue by Cohort
    name: Cumulative Average Revenue by Cohort
    model: analytics
    explore: orders
    type: looker_line
    fields:
    - orders.months_from_first_completed_order
    - orders.total_revenue
    - orders.first_order_month
    - orders.distinct_buyers
    pivots:
    - orders.first_order_month
    fill_fields:
    - orders.first_order_month
    filters:
      orders.months_from_first_completed_order: "<=24"
      orders.is_completed: '1'
    sorts:
    - orders.months_from_first_completed_order
    - orders.first_order_month
    limit: 500
    column_limit: 50
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
      expression: offset(${orders.distinct_buyers}, -1 * (row() - 1) )
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
    hide_legend: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
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
      - id: 2016-07
        name: 2016-07
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 812
      - id: 2016-08
        name: 2016-08
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 815
      - id: 2016-09
        name: 2016-09
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 818
      - id: 2016-10
        name: 2016-10
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 821
      - id: 2016-11
        name: 2016-11
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 824
      - id: 2016-12
        name: 2016-12
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 827
      - id: 2017-01
        name: 2017-01
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 830
      - id: 2017-02
        name: 2017-02
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 833
      - id: 2017-03
        name: 2017-03
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 836
      - id: 2017-04
        name: 2017-04
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 839
      - id: 2017-05
        name: 2017-05
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 842
      - id: 2017-06
        name: 2017-06
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 845
      - id: 2017-07
        name: 2017-07
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 848
      - id: 2017-08
        name: 2017-08
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 851
      - id: 2017-09
        name: 2017-09
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 854
      - id: 2017-10
        name: 2017-10
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 857
      - id: 2017-11
        name: 2017-11
        axisId: ltr
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 860
      __FILE: analytics/ecommerce_dashboard.dashboard.lookml
      __LINE_NUM: 800
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
    show_null_points: false
    interpolation: linear
    hidden_fields:
    - orders.customers_count
    - cohort_size
    - cumulative_total_revenue
    - orders.total_revenue
    - orders.distinct_buyers
    row: 14
    col: 0
    width: 12
    height: 6
    
  - title: Cumulative Lifetime Order Count
    name: Cumulative Lifetime Order Count
    model: analytics
    explore: orders
    type: looker_line
    fields:
    - orders.months_from_first_completed_order
    - orders.orders_count
    - orders.distinct_buyers
    filters:
      orders.is_completed: '1'
    sorts:
    - orders.months_from_first_completed_order
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: cumulative_total_orders
      label: Cumulative Total Orders
      expression: running_total(${orders.orders_count})
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cohort_size
      label: Cohort Size
      expression: offset(${orders.distinct_buyers}, -1 * (row() - 1) )
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
    show_view_names: false
    point_style: none
    limit_displayed_rows: false
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
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 596
      __FILE: analytics/ecommerce_dashboard.dashboard.lookml
      __LINE_NUM: 584
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
    show_null_points: false
    interpolation: linear
    hidden_fields:
    - orders.customers_count
    - cumulative_total_revenue
    - cohort_size
    - cumulative_total_orders
    - orders.distinct_buyers
    - orders.orders_count
    row: 20
    col: 12
    width: 12
    height: 6
  - title: Cumulative LTR
    name: Cumulative LTR
    model: analytics
    explore: orders
    type: looker_line
    fields:
    - orders.months_from_first_completed_order
    - orders.total_revenue
    - orders.distinct_buyers
    filters:
      orders.is_completed: '1'
    sorts:
    - orders.months_from_first_completed_order
    limit: 500
    column_limit: 50
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
      expression: offset(${orders.distinct_buyers}, -1 * (row() - 1) )
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
    show_view_names: false
    point_style: none
    limit_displayed_rows: false
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
        __FILE: analytics/ecommerce_dashboard.dashboard.lookml
        __LINE_NUM: 515
      __FILE: analytics/ecommerce_dashboard.dashboard.lookml
      __LINE_NUM: 503
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
    show_null_points: false
    interpolation: linear
    hidden_fields:
    - orders.customers_count
    - cohort_size
    - cumulative_total_revenue
    - orders.total_revenue
    - orders.distinct_buyers
    row: 14
    col: 12
    width: 12
    height: 6

  - title: Customer Retention by Cohort
    name: Customer Retention by Cohort
    model: analytics
    explore: orders
    type: table
    fields:
    - orders.months_from_first_completed_order
    - orders.distinct_buyers
    - orders.first_completed_order_month
    pivots:
    - orders.months_from_first_completed_order
    fill_fields:
    - orders.first_completed_order_month
    filters:
      orders.months_from_first_completed_order: NOT NULL
      orders.is_completed: '1'
    sorts:
    - orders.months_from_first_completed_order 0
    - orders.first_completed_order_month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: cohort_customers
      label: Cohort Customers
      expression: pivot_offset(${orders.distinct_buyers}, ${orders.months_from_first_completed_order}
        * -1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: retention_rate
      label: Retention Rate
      expression: "${orders.distinct_buyers} / ${cohort_customers}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      color_application:
        collection_id: legacy
        palette_id: legacy_sequential2
      bold: false
      italic: false
      strikethrough: false
      fields:
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - orders.customers_count
    - cohort_customers
    y_axes: []
    row: 6
    col: 0
    width: 24
    height: 8
