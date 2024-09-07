#! /usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = shots.each_slice(2).each_with_index.to_a
point = 0

frames.each do |frame, i|
  if i <= 8 && frame[0] == 10 # 9フレーム目までのストライク処理
    point += 10 + 10 + frames[i + 2][0][0].to_i if frames[i + 1][0][0].to_i == 10
    point += 10 + frames[i + 1][0].sum unless frames[i + 1][0][0].to_i == 10
  elsif i <= 8 && frame.sum == 10 # 9フレーム目までのスペア処理
    point += 10 + frames[i + 1][0][0].to_i
  else # 10フレーム目以降の処理
    point += frame.sum
  end
end
puts point
