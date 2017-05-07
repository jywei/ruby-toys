class Employee
  def initialize(name, salary)
    @name = name
    @salary = salary
  end

  def change_salary(amt)
    @salary = @salary + amt
  end

  def description
    "#{@name} makes #{@salary}"
  end
end

employees = [
  Employee.new("Bob", 100000.0),
  Employee.new("Jane", 125000.0)
]

employees.each do |emp|
  emp.change_salary(10000.0)
end

employees.each do |emp|
  puts emp.description
end
