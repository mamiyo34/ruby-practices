#!/usr/bin/env ruby
require 'optparse'
require 'date'
opt = OptionParser.new
params = {}
opt.on('-y [YEAR]', Integer) do |year|
  year if year.between?(1, 9999) #西暦4桁を上限とするため9999までとした
end
opt.on('-m [MONTH]', Integer) do |month|
  month if month.between?(1, 12) #1月〜12月
end
opt.parse!(ARGV, into: params)

display_year = params[:y] || Date.today.year
display_month = params[:m] || Date.today.month
first_day = Date.new(display_year, display_month, 1)
last_day = Date.new(display_year, display_month, -1)
date = Date.new(display_year, display_month, first_day.day)
title = display_month.to_s + "月" + display_year.to_s
day_of_week = " 日 月 火 水 木 金 土 "

puts title.center(21) #カレンダーの幅21=1日の幅3*7日
puts day_of_week
first_day.wday.times do #月初の日の曜日をカレンダー上で合わせるための処理
  print " ".to_s.rjust(3)
end
(first_day..last_day).each do |date|
  print date.day.to_s.rjust(3)
  if date.saturday?
    puts " "
  end
end
