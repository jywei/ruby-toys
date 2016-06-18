require 'nokogiri'
require 'open-uri'
require 'csv'


# Store URL to be scraped
url = "https://www.airbnb.com/s/Brooklyn--NY--United-States"

# Parse the page with Nokogiri
page = Nokogiri::HTML(open(url))

# Scrape the max number of pages and store in max_page variable
page_numbers = []

page.css('div.pagination ul li a[rel="next"]').each do |line|
  page_numbers << line.text.delete("Next")
end

puts page_numbers

max_page = page_numbers[2]

puts max_page

# Initialize empty arrays
name = []
price = []
details = []

# Loop once for every page of search results
max_page.to_i.times do |i|

  # Open search results page
  url = "https://www.airbnb.com/s/Brooklyn--NY--United-States?page=#{i+1}"
  page = Nokogiri::HTML(open(url))

  # Store data in arrays
  page.css('h3.h5.listing-name').each do |line|
    name << line.text.strip
  end

  page.css('span.price-amount').each do |line|
    price << line.text
  end

  page.css('div.text-muted.listing-location.text-truncate').each do |line|
    subarray = line.text.strip.split(/ · /)
    if subarray[2] == nil
      details << [subarray[0], subarray[1]]
    else
      details << [subarray[0], subarray[2]]
    end
    # details << line.text.strip.split(/ · /)
  end
end

# puts details

# Write data to CSV file
CSV.open("airbnb_listings.csv", "w") do |file|
  file << ["Listing Name", "Price", "Room Type", "Reviews"]
  name.length.times do |i|
    file << [name[i], price[i], details[i][0], details[i][1]]
  end
end
