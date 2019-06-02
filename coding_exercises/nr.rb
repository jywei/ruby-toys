# Implement your function below.
def non_repeating(given_string)
  char_count = {}
  given_string = given_string.split('')
  given_string.each do |ele|
    if char_count[ele]
      char_count[ele] += 1
    else
      char_count[ele] = 1
    end
  end
  given_string.each do |ele|
    return ele if char_count[ele] == 1
  end
  nil
end

# NOTE: The following input values will be used for testing your solution.
p non_repeating("abcab") # should return 'c'
p non_repeating("abab") # should return None
p non_repeating("aabbbc") # should return 'c'
p non_repeating("aabbdbc") # should return 'd'