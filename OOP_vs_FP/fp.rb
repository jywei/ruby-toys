
def change_salaries(employees_array, amount)
  change_salary = ->(slry, amt) { slry + amt }

  employees_array.map do |name, salary|
    [name, change_salary.call(salary, amount)]
  end
end


employees = [
  [ "Bob",  100000.0 ],
  [ "Jane", 125000.0 ]
]

happier_employees = change_salaries(employees, 10000.0)

happier_employees.each do |emp|
  puts "#{emp[0]} makes #{emp[1]}"
end
