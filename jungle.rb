puts "Welcome to the jungle, we have ____ and ____"

puts "What should be the first word?"
first_word = gets.chomp

puts "What should be the second word?"
second_word = gets.chomp

puts "Welcome to the jungle, we have #{first_word} and #{second_word}"

Solution to Strings exercise 2:

puts "Welcome to the jungle, we have ____ and ____"

puts "What should be the first word?"
first_word = gets.chomp

puts "What should be the second word?"
second_word = gets.chomp

new_song = "Welcome to the jungle, we have #{first_word} and #{second_word}"
puts "The completed verse is '#{new_song}'"
puts "Your song has #{new_song.length} characters in it including spaces"
puts "The song reversed sounds funny, but here it is '#{new_song.reverse}'"
