require 'nokogiri'
require 'open-uri'
require 'csv'


# Store URL to be scraped
url = "https://www.airbnb.com/s/Brooklyn--NY--United-States"

# Parse the page with Nokogiri
page = Nokogiri::HTML(open(url))

# Store data in arrays
name = []
page.css('h3.h5.listing-name').each do |line|
  name << line.text.strip
end

price = []
page.css('span.price-amount').each do |line|
  price << line.text
end

details = []
page.css('div.text-muted.listing-location.text-truncate').each do |line|
  details << line.text.strip.delete("          ()").split(/·/)
end

# puts details

# Write data to CSV file
CSV.open("airbnb_listings.csv", "w") do |file|
  file << ["Listing Name", "Price", "Room Type"]
  name.length.times do |i|
    file << [name[i], price[i], details[i][0]]
  end
end
