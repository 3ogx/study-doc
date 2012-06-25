#!/usr/bin/ruby

def fact(n)
  if n == 0
    1
  else
    n * fact(n-1)
  end
end

# puts fact(ARGV[0].to_i)

def caseDemo()
  i = 8
  case i
  when 1,2..5
    puts "1..5"
  when 6..10
    puts "6..10"
  end
end

puts caseDemo()
