#!/usr/bin/env ruby
require 'optparse'
opt = OptionParser.new
opt.on('-y [YEAR]', Integer) do |year|
  @year = year if year.between?(1, 9999) #-yで1〜9999が引数として指定されたとき@yearに代入
end
opt.on('-m [MONTH]', Integer) do |month|
  @month = month if month.between?(1, 12) #-mで1〜12が引数として指定されたとき@monthに代入
end
opt.parse(ARGV)

require 'date'
@year = Date.today.year if @year == nil #@yearがnilのとき今日が属する年を代入
@month = Date.today.month if @month == nil #@monthがnilのとき今日が属する月を代入

first_day = Date.new(@year, @month, 1) #月初の日付を取得
last_day = Date.new(@year, @month, -1) #月末の日付を取得
date = Date.new(@year, @month, first_day.day) #カレンダーに表示する日付の変数に月初の日付を代入
title = @month.to_s + "月" + @year.to_s #カレンダーのタイトル
day_of_week = " 日 月 火 水 木 金 土 " #曜日

puts title.center(21) #カレンダータイトルを21桁の長さでセンタリングして表示
puts day_of_week
first_day.wday.times do #月初の日付の曜日の数値（日曜日を0とした0-6）の回数分次の処理を繰り返す
  print " ".to_s.rjust(3) #3桁の長さの空欄を改行なしで表示
end
while date <= last_day do #月初から月末まで１日づつ次の処理を繰り返す
  if date.strftime('%a') == "Sat" #変数dateが土曜日のとき
    puts date.day.to_s.rjust(3) #変数dateの日付を3桁の長さで、右詰表示し改行
  else #変数dateが土曜日以外のとき
    print date.day.to_s.rjust(3) #変数dateの日付を3桁の長さで、改行なしで右詰表示
  end
 date = date += 1 #変数dateに1日加える
end