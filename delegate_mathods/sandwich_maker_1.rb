class SandwichMaker
  def make_me_a_sandwich
    puts 'OKAY'
  end
end

class LazyEmployee1
  def initialize(sandwich_maker)
    @sandwich_maker = sandwich_maker
  end

  def make_me_a_sandwich
    sandwich_maker.make_me_a_sandwich
  end

  private
  attr_reader :sandwich_maker
end

sandwich_maker = SandwichMaker.new
lazy_employee = LazyEmployee1.new(sandwich_maker)
lazy_employee.make_me_a_sandwich

