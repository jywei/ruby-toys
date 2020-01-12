def WordSplit(arr)
  word, tmp_array = arr.first, arr.last.split(",")
  index = 0
  while index < word.size - 1
    left, right = word[0..index], word[index + 1..-1]
    if tmp_array.include?(left) && tmp_array.include?(right)
      return [left, right].join(",")
    end
    index += 1
  end
  "not possible"
end

p WordSplit(["hellocat", "apple,bat,cat,goodbye,hello,yellow,why"]) # "hello,cat"
p WordSplit(["baseball", "a,all,b,ball,bas,base,cat,code,d,e,quit,z"]) # "base,ball"
p WordSplit(["abcgefd", "a,ab,abc,abcg,b,c,dog,e,efd,zzzz"]) # "abcg,efd"
p WordSplit(["testerino", "crazy,cat,dog,fish"]) # "not possible"
