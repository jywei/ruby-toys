require 'forwardable'

class SandwichMaker
  def make_me_a_sandwich
    puts 'OKAY'
  end
end

class LazyEmployee3
  extend Forwardable

  def initialize(sandwich_maker)
    @sandwich_maker = sandwich_maker
  end

  def_delegators :@sandwich_maker, :make_me_a_sandwich
end

sandwich_maker = SandwichMaker.new
lazy_employee = LazyEmployee3.new(sandwich_maker)
lazy_employee.make_me_a_sandwich
