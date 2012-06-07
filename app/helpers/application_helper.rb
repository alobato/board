require 'lazy_high_charts/layout_helper'

module ApplicationHelper

  def graph(metric, options = {})
    options.reverse_merge!(
      :chart_width => 800,
      :chart_height => 400,
      :chart_type => 'line',
      :without_x => false,
      :color => '#86CBDD'
    )
    
    hc = LazyHighCharts::HighChart.new('graph', { :style => "width:#{options[:chart_width]}px;height:#{options[:chart_height]}px" }) do |f|
      f.options[:colors] = [options[:color]]
      f.options[:title][:text] = ''
      f.options[:subtitle][:text] = ''
      f.options[:chart][:width] = options[:chart_width]
      f.options[:chart][:height] = options[:chart_height]
      f.options[:chart][:defaultSeriesType] = options[:chart_type]
      f.options[:chart][:backgroundColor] = "rgba(255, 255, 255, 0.0)"
      f.options[:legend][:enabled] = false
      f.options[:tooltip][:backgroundColor] = 'rgba(0, 0, 0, 0.75)'
      f.options[:tooltip][:style] = { 'font-size' => '9px', :color => '#999' }
      f.options[:yAxis][:labels] = {:style => { 'font-size' => '9px', :color => '#999' }}
      f.options[:yAxis][:gridLineColor] = '#444'
      f.options[:xAxis][:lineColor] = '#444'
      f.options[:xAxis][:labels] = {:style => { 'font-size' => '8px', :color => '#999' }}

      values = metric.values.recent(20)

      values = values.sort_by! {|d| d.created_at || 0 }
      dt = values.map { |v| v.decimal_value.to_f }
      xs = values.map { |v| v.created_at.strftime("%H:%M") }

      xs = values.map { |v| '' } if options[:without_x]
      f.options[:tooltip][:enabled] = false if options[:without_x]

      f.series(name: metric.name, data: dt)
      f.options[:xAxis][:categories] = xs

      # f.options[:yAxis][:labels][:style][:fontSize] = '8px'
    end
    high_chart("metric_#{metric.id.to_s}", hc)
  end

end
