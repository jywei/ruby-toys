require 'json'
require_relative 'file_reader'

class JsonReader < FileReader
  def read
    puts 'JSON reader test'
    json_file = File.read(@file)
    contents = JSON.load(json_file)
    puts contents
  end
end
