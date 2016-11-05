require_relative 'file_reader'

# x = FileReader.new('sample.txt')
# x = FileReader.new(ARGV[0])
# puts x.read

FileReader.new(ARGV[0]).read

