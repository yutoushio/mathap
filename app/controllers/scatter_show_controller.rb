# -*- coding: utf-8 -*-
class ScatterShowController < ApplicationController
  def index
    @scatter = Scatter.find(params[:scatter_id])
    @scat_number = @scatter.scat_numbers.all
    @scata_number = @scatter.scata_numbers.all
    @scat_data = Array.new()
    @scata_data = Array.new()
    @tmp = Array.new()
    @tmp2 = Array.new()
    @tmp3 = Array.new()
    @scat_number.each do |n|
      @tmp << n
    end
    #    @data = @tmp.size.to_i
    for i in 0..(@tmp.size.to_i-1) do
      @scat_data << @tmp[i].number
    end

    @scata_number.each do |n|
      @tmp2 << n
    end
    #    @data = @tmp.size.to_i
    for i in 0..(@tmp2.size.to_i-1) do
      @scata_data << @tmp2[i].number
    end
    for i in 0..(@scata_data.size.to_i-1) do
      @tmp3[i] = [@scat_data[i],@scata_data[i]]
    end
    @scat_average = 0
    @scata_average = 0
    for i in 0..(@scata_data.size.to_i-1) do
      @scat_average = @scat_average + @scat_data[i]
      @scata_average = @scata_average + @scata_data[i]
    end
    @scata_average = @scata_average/@scata_data.size
    @scat_average = @scat_average/@scat_data.size
    @scat_dispersion = 0
    @scata_dispersion = 0
    for i in 0..(@scata_data.size.to_i-1) do
      @scat_dispersion = @scat_dispersion + (@scat_data[i] - @scat_average)*(@scat_data[i] - @scat_average)
      @scata_dispersion = @scata_dispersion + (@scata_data[i] - @scata_average)*(@scata_data[i] - @scata_average)
    end
    @scat_dispersion = @scat_dispersion/@scat_data.size
    @scata_dispersion = @scata_dispersion/@scata_data.size
    @dispersion = 0
    for i in 0..(@scata_data.size.to_i-1) do
      @dispersion = @dispersion + (@scat_data[i] - @scat_average)*(@scata_data[i] - @scata_average)
    end
    @dispersion = @dispersion/@scata_data.size
    @r = @dispersion/(@scat_dispersion*@scata_dispersion)
    @chart = LazyHighCharts::HighChart.new("scatter") do |c|
      c.chart(type: 'scatter',width:700,heigth:700)
      c.title(text: @scatter.title)
      c.xAxis(labels: {
                style: {
                  fontSize: '30px'}
              })
      c.yAxis(labels: {
                style: {
                  fontSize: '30px'}
              })
      c.series(name: "A", data: @tmp3)
    end

  end
end
