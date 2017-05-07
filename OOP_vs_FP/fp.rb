def change_salaries(employees_array, amount)
  employees_array.map do |name, salary|
    [name, change_salary(salary, amount)]
  end
end

def change_salary(salary, amount)
  salary + amount
end

employees = [
  [ "Bob",  100000.0 ],
  [ "Jane", 125000.0 ]
]

happier_employees = change_salaries(employees, 10000.0)

happier_employees.each do |emp|
  puts "#{emp[0]} makes #{emp[1]}"
end
