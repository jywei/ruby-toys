def hanoi(n, a, b, c)
  if n == 1
    [{from: a, to: c}]
  else
    hanoi(n - 1, a, c, b) + hanoi(1, a, b, c) + hanoi(n - 1, b, a, c)
  end
end

puts "Enter the number of plates: "

hanoi(gets.to_i, "A", "B", "C").each do |move|
  print "Plate is moved from #{move[:from]} to #{move[:to]}\n"
end
