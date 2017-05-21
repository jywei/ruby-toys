class SandwichMaker
  def make_me_a_sandwich
    puts 'OKAY'
  end
end

class LazyEmployee5 < SimpleDelegator
  def initialize(sandwich_maker)
    super
  end
end

sandwich_maker = SandwichMaker.new
lazy_employee = LazyEmployee5.new(sandwich_maker)
lazy_employee.make_me_a_sandwich
