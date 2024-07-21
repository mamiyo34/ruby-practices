#!/usr/bin/env ruby
fizzbuzz = 1
while fizzbuzz < 21
  case
  when fizzbuzz % 3 == 0
    if fizzbuzz % 5 == 0
      puts "FizzBuzz"
    else
      puts "Fizz"
    end
  when fizzbuzz % 5 == 0
    puts "Buzz"
  else
      puts fizzbuzz
  end
  fizzbuzz = fizzbuzz + 1
end
