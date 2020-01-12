require 'pry'

def MissingDigit(str)
  equation, result = str.delete(" ").split("=")
  
  if result =~ /x/
    (-9..9).each do |digit|
      return digit if eval(equation) == (result.sub("x", digit.to_s)).to_i
    end
  else
    (-9..9).each do |digit|
      begin
        evaluation = eval(equation.sub("x", digit.to_s))
      rescue ZeroDivisionError
        next
      end
      return digit if evaluation == result.to_i
    end
  end
end

# def MissingDigit(str)
#   # turn the str into array with no whitespaces
#   str = str.split(" ")

#   # find x and cal result. 
#   if str[4].include?"x"
#   	var = str[4]
#   	result = str[0].to_i + str[2].to_i if str[1] == "+"
#   	result = str[0].to_i - str[2].to_i if str[1] == "-"
#   	result = str[0].to_i * str[2].to_i if str[1] == "*"
#   	result = str[0].to_i / str[2].to_i if str[1] == "/"
#   elsif str[0].include?"x"
#   	var = str[0]
#   	result = str[4].to_i - str[2].to_i if str[1] == "+"
#   	result = str[4].to_i + str[2].to_i if str[1] == "-"
#   	result = str[4].to_i / str[2].to_i if str[1] == "*"
#   	result = str[4].to_i * str[2].to_i if str[1] == "/"
#    elsif str[2].include?"x"
#    	var = str[2]
#    	result = str[4].to_i - str[0].to_i if str[1] == "+"
#    	result = str[0].to_i = str[4].to_i if str[1] == "-"
#    	result = str[4].to_i / str[0].to_i if str[1] == "*"
#    	result = str[0].to_i / str[4].to_i if str[1] == "/"
#    end

#    # check if var x is alone or with other nums
#    if var == "x"
#    	return result.to_i
#    else 
#    	missing = var.index("x")
#    	return result.to_s[missing].to_i
#    end        
# end

# keep this function call here 
# puts MissingDigit(STDIN.gets)

# p MissingDigit("3x + 12 = 46") # 4
# p MissingDigit("34 + 1x = 46") # 2
# p MissingDigit("4 - 2 = x") # 2
p MissingDigit("2 - 4 = x") # 2
# p MissingDigit("1x0 * 12 = 1200") # 0
# p MissingDigit("100 * 12 = 1x00") # 2
# p MissingDigit("24 / x = 12") # 2
# p MissingDigit("2x / 2 = 12") # 4
# p MissingDigit("24 / 2 = 1x") # 2
# p MissingDigit("2x / 2 = 10") # 0
# p MissingDigit("0 / 2x = 0") # 0