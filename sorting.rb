puts "Enter the first word: "
word1 = gets.chomp

puts "Enter the second word: "
word2 = gets.chomp

puts "Enter the third word: "
word3 = gets.chomp

puts "Enter the forth word: "
word4 = gets.chomp

puts "Enter the fifth word: "
word5 = gets.chomp

puts ""

words = [word1, word2, word3, word4, word5].sort!

words.each_with_index do |word, index|
  if index.even?
    puts word.upcase
  else
    puts word.downcase
  end
end
