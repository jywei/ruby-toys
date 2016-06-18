puts "Enter Segments: "
entry = gets.chomp.split

if entry[0] > entry[1]
  puts "That is not valid"
elsif entry.length > 2
  puts "That is not valid"
end

new_entries = []
entry.map do |value|
  new_entries << value.to_i
end

entry_segment = new_entries[0]
exit_segment = new_entries[1]
e_e_range = (entry_segment..exit_segment).to_a

@dict = [2,3,1,3,2,1,3,2,1,1,2]

largest_vehicle = e_e_range.map do |value|
  @dict[value]
end

puts largest_vehicle.min


