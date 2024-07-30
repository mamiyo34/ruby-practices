#!/usr/bin/env ruby
require 'optparse'
require 'date'
opt = OptionParser.new
params = {}
opt.on('-y [YEAR]', Integer) do |year|
  year if year.between?(1, 9999) #オプション-yは1〜9999のみ整数の引数として受け付ける
end
opt.on('-m [MONTH]', Integer) do |month|
  month if month.between?(1, 12) #オプション-mは1〜12のみ整数の引数として受け付ける
end
opt.parse!(ARGV, into: params) #空ハッシュparamsに値を格納

display_year = params[:y] || Date.today.year #-yの引数がnilのときdisplay_yearに今日が属する年を代入
display_month = params[:m] || Date.today.month #-mの引数がnilのときdisplay_monthに今日が属する月を代入
first_day = Date.new(display_year, display_month, 1) #月初の日付を取得
last_day = Date.new(display_year, display_month, -1) #月末の日付を取得
date = Date.new(display_year, display_month, first_day.day) #カレンダーに表示する日付の変数に月初の日付を代入
title = display_month.to_s + "月" + display_year.to_s #カレンダーのタイトル
day_of_week = " 日 月 火 水 木 金 土 " #曜日

puts title.center(21) #カレンダータイトルを21桁の長さでセンタリングして表示
puts day_of_week
first_day.wday.times do #月初の日付の曜日の数値（日曜日を0とした0-6）の回数分次の処理を繰り返す
  print " ".to_s.rjust(3) #3桁の長さの空欄を改行なしで表示
end
(first_day..last_day).each do |date| #月初から月末まで１日づつ次の処理を繰り返す
  print date.day.to_s.rjust(3) #日付を3桁の長さで改行なしで表示
  if date.saturday? #土曜日の場合のみ、空欄を表示し改行
    puts " "
  end
end
