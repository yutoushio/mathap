# -*- coding: utf-8 -*-
class BarShowController < ApplicationController
  def index
    @bar = Bar.find(params[:bar_id])
    @number = @bar.bar_numbers.all
    @memory = @bar.memories.all
    @memories = Array.new()
    @data = Array.new()
    @tmp = Array.new()
    @tmp2 = Array.new()
    @sort_data = Array.new

    @number.each do |n|
      @tmp << n
    end
    #    @data = @tmp.size.to_i

    for i in 0..(@tmp.size.to_i-1) do
      @data << @tmp[i].number
    end

    @data_sort = @data.sort

    @memory.each do |n|
      @tmp2 << n
    end
    #    @data = @tmp.size.to_i

    for i in 0..(@tmp2.size.to_i-1) do
      @memories << @tmp2[i].body
    end

    datas = Array.new
    q1ar = Array.new
    q3ar = Array.new
    ssiizzee = @data_sort.size
    def check_medium(data)
      size = data.size
      size_m = size/2
      if size%2 == 0
        m = (data[size_m]+data[(size_m - 1)])/2
      else
        m = data[(size/2)]
      end
    end
    medium = check_medium(@data_sort)

    if ssiizzee % 2 ==0
      cant = 0
      for i in 0..ssiizzee/2 -1
        q1ar[i] = @data_sort[i]
      end
      for i in ssiizzee/2..(ssiizzee-1)
        q3ar[cant]= @data_sort[i]
        cant = cant+1
      end
      cant = 0
    else
      cant = 0
      for i in 0..ssiizzee/2 -1
        q1ar[i] = @data_sort[i]
      end
      for i in ssiizzee/2 +1..(ssiizzee -1)
        q3ar[cant] = @data_sort[i]
        cant = cant+1
      end
      cant = 0
    end

    q1 = check_medium(q1ar)
    q3 = check_medium(q3ar)
    min = @data_sort.min
    max = @data_sort.max
    month = ['月','火','水','木','金','土']
    @bar_chart = LazyHighCharts::HighChart.new("graph") do |c|
      c.chart(type: 'column')
      c.title(text: @bar.title)
      c.xAxis(categories: @memories,labels: {
                style: {
                  fontSize: '30px'}
              })
      c.yAxis(labels: {
                style: {
                  fontSize: '30px',
                  gridLineColor: 'transparent'
                }
              })

      c.series(name: "A", data: @data)
    end
    @box_data = @data
    @box_data = @box_data.sort
        @sort_chart = LazyHighCharts::HighChart.new("sort_graph") do |c|
      c.chart(type: 'column')
      c.title(text: @bar.title)
      c.xAxis(categories: @box_data,labels: {
                style: {
                  fontSize: '30px'}
              })
      c.yAxis(categories: '',labels: {
                enabled:false,
                style: {
                  fontSize: '30px',
                  lineColor: 'transparent',
                  gridLineColor: 'transparent'
                }
                })

      c.series(name: "A", data: @box_data)
    end
    @box_chart = LazyHighCharts::HighChart.new("box_graph") do |f|
      f.chart(inverted:true,type:'boxplot')
      f.title(text: "箱ひげ図")
      f.yAxis(labels: {
                style: {
                  fontSize: '20px'}
              })
      f.series(name: 'A' ,
               data: [[1,min,q1,medium,q3,max]])
    end
    @average = 0
    for i in 0..(@data.size.to_i-1) do
      @average = @average+@data[i]
    end
    @average = @average/(@data.size)
    @average_array = Array.new()
    @averages = Array.new()
    @dispersion = 0
    @medium_at = medium
    @medium_array = Array.new()
    @medium_charts = Array.new()
    for i in 0..(@data.size.to_i-1) do
      @average_array[i] = @data[i] - @average
      @averages[i] = @average
      @dispersion = @dispersion + (@data[i]-@average)*(@data[i]-@average)
      @medium_array[i] = @medium_at
      @medium_charts[i] = @data[i] - @medium_at
    end
    @dispersion = @dispersion/(@data.size)
    @deviation = Math.sqrt(@dispersion)

    @average_double_chart = LazyHighCharts::HighChart.new("average_double_graph") do |f|
      f.title(text: "平均との比較")
      f.xAxis(categories: @memories,labels: {
                style: {
                  fontSize: '30px'}
              })
      f.yAxis(labels: {
                style: {fontSize: '30px'}
              })

      f.series(name: '元のグラフ' ,data: @data,type:'column')
      f.series(name: '平均' ,data:@averages,type:'line')
    end
    @average_chart = LazyHighCharts::HighChart.new("average_graph") do |f|
      f.chart(type:'column')
      f.title(text: "平均からの差")
      f.xAxis(categories: @memories,labels: {
                style: {
                  fontSize: '30px'}
              })
      f.yAxis(labels: {
                style: {
                  fontSize: '30px'}
              })

      f.series(name: 'A' ,
               data: @average_array)
    end

    @medium_double_chart = LazyHighCharts::HighChart.new("medium_double_graph") do |f|
      f.title(text: "中央値との比較")
      f.xAxis(categories: @memories,labels: {
                style: {
                  fontSize: '30px'}
              })
      f.yAxis(labels: {
                style: {fontSize: '30px'}
              })

      f.series(name: '元のグラフ' ,data: @data,type:'column')
      f.series(name: '中央値' ,data:@medium_array,type:'line')
    end
    @medium_chart = LazyHighCharts::HighChart.new("medium_graph") do |f|
      f.chart(type:'column')
      f.title(text: "中央値からの差")
      f.xAxis(categories: @memories,labels: {
                style: {
                  fontSize: '30px'}
              })
      f.yAxis(labels: {
                style: {
                  fontSize: '30px'}
              })

      f.series(name: 'A' ,
               data: @medium_charts)
    end



  end
end
