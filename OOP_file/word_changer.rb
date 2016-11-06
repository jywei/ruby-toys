FILENAME = ARGV[0]
WORD_TO_CHANGE = ARGV[1]
NEW_WORD = ARGV[2]

def change_words
  contents = File.read(FILENAME)
  contents = contents.gsub(Regexp.new('\b' + WORD_TO_CHANGE + '\b'), NEW_WORD)
  File.open(FILENAME, "w") do |f|
    f << contents
  end
end

change_words
