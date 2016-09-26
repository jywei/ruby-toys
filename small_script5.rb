#逐一行印出
f = File.open("small_script1.rb")
while line = f.gets do
    puts line
end
f.close

#逐一行顯示
File.open( "small_script2.rb" , "r" ) do |f|
  while line = f.gets
    puts line
  end
end
