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
  point += frame.sum
  next if frame.sum != 10 || i >= 9
  point += frames[i + 1][0][0]
  next if frame[0] != 10
  if frames[i + 1][0][0] == 10
    point += frames[i + 2][0][0]
  else
    point += frames[i + 1][0][1]
  end
end
puts point
