# 打開檔案，並寫入文字（若沒檔案會直接新增）
File.open('small_script3.rb', 'w') do |f|
  f.puts "Ruby"
  f.write "Java\n"
  f << "Python\n"
end
