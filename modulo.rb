#12345 - input
#1+2+3+4+5 - output

def parlay(input_num)
  result = 0
  while input_num % 10 != 0
    result += (input_num % 10)
    input_num /= 10
  end
  result
end

puts parlay(12345)
