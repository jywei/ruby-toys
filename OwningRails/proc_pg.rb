# my_proc = lambda { |x| p "yeahs" }
my_proc = -> {|x| p "yeahs" }

p "will it run?"
my_proc.call
