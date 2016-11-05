# require_relative 'file_reader'
# require_relative 'csv_reader'
require_relative 'yml_reader'

# x = FileReader.new('sample.txt')
# x = FileReader.new(ARGV[0])
# puts x.read

# FileReader.new(ARGV[0]).read

# CsvReader.new(ARGV[0]).read

YmlReader.new(ARGV[0]).read

