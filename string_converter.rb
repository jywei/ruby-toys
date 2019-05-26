def converter(str)
  # arr = str.split('')
  # prev = ''
  # chuncked = ''
  # counter = 1
  # arr.map do |char|
  #   if char == prev
  #     counter++
  #   elsif counter == 1
  #     chuncked += char
  #     prev = char
  #   else
  #
  #   end
  # end

  str.gsub(/(.)\1+/) { |x| "#{Regexp.last_match(1)}#{x.size}" }
end

# "aaabaabbbcc"
# "a3b1a2b3c2"

# 1. ["aaa", "b", "aa", "bbb", "cc"]
p converter("aaabaabbbcc")
