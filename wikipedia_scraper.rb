require 'HTTParty'
require 'nokogiri'
require 'JSON'
require 'Pry'
require 'csv'
require 'curb'

url = "https://en.wikipedia.org/wiki/List_of_current_NBA_team_rosters"
page = Curl.get(url)

puts page.body_str.css('a')
