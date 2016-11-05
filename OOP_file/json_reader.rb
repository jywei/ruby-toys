require 'json'
require 'awesome_print'
require_relative 'file_reader'

class JsonReader < FileReader
  def read
    puts 'JSON reader test'
    json_file = File.read(@file)
    contents = JSON.load(json_file)
    ap contents
  end
end
