=begin
Given a string s, return the longest 
palindromic substring in s.

Example 1:
Input: s = "babad"
Output: "bab"
Explanation: "aba" is also a valid answer.

Example 2:
Input: s = "cbbd"
Output: "bb"

Constraints:
1 <= s.length <= 1000
s consists of only digits and English letters.
=end

# @param {String} s
# @return {String}
def longest_palindrome(s)
  return s if s.length <= 1

  n = s.length
  dp = Array.new(n) { Array.new(n, false) }
  start = 0
  max_len = 1

  # All substrings of length 1 are palindromes
  (0...n).each do |i|
    dp[i][i] = true
  end

  # Check for substrings of length 2
  (0...n - 1).each do |i|
    if s[i] == s[i + 1]
      dp[i][i + 1] = true
      start = i
      max_len = 2
    end
  end

  # Check for substrings of length greater than 2
  (3..n).each do |len|
    (0...n - len + 1).each do |i|
      j = i + len - 1
      if dp[i + 1][j - 1] && s[i] == s[j]
        dp[i][j] = true
        start = i
        max_len = len
      end
    end
  end

  s[start, max_len]
end


# slower answer
def slow_longest_palindrome(s)
  return s if s.length <= 1

  longest = s[0]
  (0...s.length).each do |i|
    (i...s.length).each do |j|
      if s[i..j] == s[i..j].reverse && s[i..j].length > longest.length
        longest = s[i..j]
      end
    end
  end
  longest
end