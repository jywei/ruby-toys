require 'yaml'
require 'awesome_print'
require_relative 'file_reader'

class YmlReader < FileReader
  # attr_accessor :file

  # def initialize(file)
  #   @file = file
  # end

  def read
    puts 'Reading in a YML file'
    contents = YAML.load_file(@file)
    ap contents
  end
end

# x = YmlReader.new('sample.yml')
# x.read
