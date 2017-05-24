class SuperArray < SimpleDelegator
  def [](*args)
    super + 1
  end
end

SuperArray.new([1])[0]  #=> 2
