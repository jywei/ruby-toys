require_relative("averages.rb")

class Input

  attr_accessor :students_name, :score1, :score2, :score3, :students_and_scores

  def user_input
    @students_and_scores = {}
    counter = 0

    while counter < 100
      puts "Enter a student's name: "
      @students_name = gets.chomp
      puts "Enter the first test score: "
      @score1 = gets.chomp.to_i
      puts "Enter the second test score: "
      @score2 = gets.chomp.to_i
      puts "Enter the third test score: "
      @score3 = gets.chomp.to_i

      puts "Are you done entering this student's information? "
      @exit_loop = gets.chomp

      @students_and_scores[@students_name] = [@score1, @score2, @score3]

      break if @exit_loop == "Yes"
      counter += 1
    end

  end

end

testing = Input.new

puts testing.user_input

testing_calculator = Calculator.new
testing_calculator.average(testing.students_and_scores)
