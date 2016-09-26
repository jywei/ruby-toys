#查看檔案是否存在，建立時間，檔案大小
puts File.exists? 'tempfile'

f = File.new 'tempfile', 'w'
puts File.mtime 'tempfile'
puts f.size

File.rename 'tempfile', 'tempfile2'

f.close
