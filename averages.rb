class Calculator

  def average(object)
    object.each do |k, v|
      puts (v[0] + v[1] + v[2])/3
    end
  end

end
