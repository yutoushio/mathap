# -*- coding: utf-8 -*-
class LineShowController < ApplicationController
  def index
    @line = Line.find(params[:line_id])
    @number = @line.line_numbers.all
    @data = Array.new()
    @tmp = Array.new()
    @tmp2 = Array.new()
    @average_array = Array.new()
    @memories = @line.line_memories.all
    @line_memory = Array.new
    @average
    @number.each do |n|
      @tmp << n
    end
    @memories.each do |n|
      @tmp2 << n
    end
    for i in 0..(@tmp2.size.to_i - 1) do
      @line_memory << @tmp2[i].body
    end
    
#    @data = @tmp.size.to_i
     for i in 0..(@tmp.size.to_i-1) do
       @data << @tmp[i].number
     end
    @average = 0
     for i in 0..(@data.size.to_i-1) do
       @average = @average + @data[i]
     end

    @average = @average/@data.size.to_i
    @dispersion = 0
    for i in 0..(@data.size.to_i-1) do
       @average_array[i] = @average
      @dispersion = @dispersion + (@data[i]-@average)*(@data[i]-@average)
    end
    @dispersion = @dispersion/(@data.size)
    @deviation = Math.sqrt(@dispersion)
    month = ['1日','2日','3日','4日','5日','6日']
     @chart = LazyHighCharts::HighChart.new("graph") do |c|
      c.title(text: @line.title)
      c.xAxis(categories: @line_memory,labels: {
                style: {
                  fontSize: '30px'}
              })
      c.yAxis(labels: {
                style: {
                  fontSize: '30px'}
              })
      c.series(name: "A", data: @data)
     end
    @average_chart = LazyHighCharts::HighChart.new("average_graph") do |c|
      c.title(text: "平均との比較")
      c.xAxis(categories: @line_memory,labels: {
                style: {
                  fontSize: '30px'}
              })
      c.series(name: "データ", data: @data,type:'line')
      c.series(name: "平均", data: @average_array,type:'line')
     end
  end
end
