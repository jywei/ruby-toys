# Implement your function below.
def is_one_away(s1, s2)
  s1 = s1.split('')
  s2 = s2.split('')
  return false if s1.size - s2.size >= 2 || s2.size - s1.size >= 2
  if s1.size == s2.size
    is_one_away_same_length(s1, s2)
  elsif s1.size > s2.size
    is_one_away_diff_lengths(s1, s2)
  else
    is_one_away_diff_lengths(s2, s1)
  end
end

def is_one_away_same_length(s1, s2)
  count_diff = 0
  s1.each_with_index do |_ele, index|
    next if s1[index] == s2[index]
    count_diff += 1
    return false if count_diff > 1
  end
  true
end

# Assumption: s1.size == s2.size + 1
def is_one_away_diff_lengths(s1, s2)
  count_diff = 0
  s1.each_with_index do |_ele, index|
    next if s1[index + count_diff] == s2[index]
    count_diff += 1
    return false if count_diff > 1
  end
  true
end

# NOTE: The following input values will be used for testing your solution.
p is_one_away("abcde", "abcd")  # should return True
p is_one_away("abde", "abcde")  # should return True
p is_one_away("a", "a")  # should return True
p is_one_away("abcdef", "abqdef")  # should return True
p is_one_away("abcdef", "abccef")  # should return True
p is_one_away("abcdef", "abcde")  # should return True
p is_one_away("aaa", "abc")  # should return False
p is_one_away("abcde", "abc")  # should return False
p is_one_away("abc", "abcde")  # should return False
p is_one_away("abc", "bcc")  # should return False
