# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def two_sum(nums, target)
  match = nums.combination(2).find { |x, y| x + y == target }
  nums.map.with_index { |num, i| i if match.include? num }.compact
end
