# zip_codes = {
#   "yo": 123,
#   "man": 456,
#   "gay": 789,
#   "boy": 101112
# }

# def get_names(hash)
#   hash.each { |k, v| puts k }
# end

# def get_code(hash, key)
#   hash[key]
# end

# loop do
#   puts "Say something! (y/n)"
#   answer = gets.chomp.downcase
#   if answer != "y"
#     break
#   end
#   puts "say 'yo man gay boy'"
#   get_names(zip_codes)
#   print "Enter your selection > "
#   prompt = gets.chomp
#   if zip_codes.include?(prompt.downcase)
#     puts "the input of #{prompt} is: #{get_code(zip_codes, prompt.downcase)}"
#   else
#     puts "Wrong!!"
#   end
# end


zip_codes = {
  "new brunswick" => "08901",
  "new york" => "10012",
  "edison" => "08837",
  "weehauken" => "06903"
}

def get_city_names(hash)
  hash.each { |key, value| puts key }
end

def get_zip_code(hash, key)
  hash[key]
end

loop do
  puts "Do you want to look up a zip code? (Y/N)"
  answer = gets.chomp.downcase
  if answer != "y"
    break
  end
  puts "Which city do you want to lookip zipcode for?"
  get_city_names(zip_codes)
  print "Enter your selection > "
  prompt = gets.chomp
  if zip_codes.include?(prompt.downcase)
    puts "The zip code for #{prompt} is #{get_zip_code(zip_codes, prompt.downcase)}"
  else
    puts "The area you entered is not in the zip code dictionary"
  end
end
