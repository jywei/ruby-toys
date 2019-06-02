# Implement your function below.
def is_rotation(list1, list2)
  return false if list1.size != list2.size
  return false unless (key_loc = list2.index(list1[0]))
  ele_to_unshift = list1.count - key_loc
  tmp_list_2 = list2.pop(ele_to_unshift)
  new_list_2 = list2.unshift(tmp_list_2).flatten
  list1 == new_list_2
end

# NOTE: The following input values will be used for testing your solution.
list1 = [1, 2, 3, 4, 5, 6, 7]
list2a = [4, 5, 6, 7, 8, 1, 2, 3]
p is_rotation(list1, list2a)
# is_rotation(list1, list2a) should return False.
list2b = [4, 5, 6, 7, 1, 2, 3]
p is_rotation(list1, list2b)
# is_rotation(list1, list2b) should return True.
list2c = [4, 5, 6, 9, 1, 2, 3]
p is_rotation(list1, list2c)
# is_rotation(list1, list2c) should return False.
list2d = [4, 6, 5, 7, 1, 2, 3]
p is_rotation(list1, list2d)
# is_rotation(list1, list2d) should return False.
list2e = [4, 5, 6, 7, 0, 2, 3]
p is_rotation(list1, list2e)
# is_rotation(list1, list2e) should return False.
list2f = [1, 2, 3, 4, 5, 6, 7]
p is_rotation(list1, list2f)
# is_rotation(list1, list2f) should return True.
