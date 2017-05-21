require 'active_support/core_ext/module/delegation'

class SandwichMaker
  def make_me_a_sandwich
    puts 'OKAY'
  end
end

class LazyEmployee4
  def initialize(sandwich_maker)
    @sandwich_maker = sandwich_maker
  end

  delegate :make_me_a_sandwich, to: :sandwich_maker

  private
  attr_reader :sandwich_maker
end

sandwich_maker = SandwichMaker.new
lazy_employee = LazyEmployee4.new(sandwich_maker)
lazy_employee.make_me_a_sandwich
