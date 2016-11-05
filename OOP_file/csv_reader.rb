require 'csv'
require_relative 'file_reader'

class CsvReader < FileReader
  # attr_accessor :file

  # def initialize(file)
  #   @file = file
  # end

  def read
    puts 'Reading in a CSV file'
    contents = CSV.read(@file)
    puts contents
  end
end

# x = CsvReader.new('sample.csv')
# x.read
