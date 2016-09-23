require 'csv'

CSV.open("myanmar_universities.csv", "w") do |csv|
  csv << ["University Names"]
end

# .gsub('"','h')
