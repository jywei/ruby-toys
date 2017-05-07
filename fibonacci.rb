def fibonacci(n)
  return 0 if n == 0
  n <= 2 ? 1 : (fibonacci(n - 1) + fibonacci(n - 2))
end

print "How many Fibonacci series do you want? "
length = gets.to_i

puts (0..(length - 1)).map{ |x| fibonacci(x) }
