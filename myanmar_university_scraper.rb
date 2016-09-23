require 'open-uri'
require 'HTTParty'
require 'nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

url = "https://en.wikipedia.org/wiki/List_of_universities_in_Myanmar"
page = Nokogiri::HTML(open(url))

# puts page.css('span.mw-headline a').text

# page.css('span.mw-headline a').each do |line|
#   puts line.text
# end


name = []
page.css('div#mw-content-text ul li a').each do |line|
  name << line.text
end

CSV.open("myanmar_universities1.csv", "w") do |file|
  file << ["University Names"]
  name.length.times do |i|
    file << [name[i]]
  end
end

