students_standing = {}

@student_count = 0

until @student_count > 2 do
  puts "Enter name of a student: "
  student_name = gets.chomp

  puts "Enter grades for student: "
  grades = gets.chomp.to_i

  students_standing[student_name] = grades

  @student_count += 1
end

puts ""

puts students_standing.sort_by {|student_name, grade| grade}
