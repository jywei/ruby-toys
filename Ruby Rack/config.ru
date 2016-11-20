# require './hello.rb'
# require './print.rb'
require './timing.rb'

use Timing, pid: true, { puts "Timing is being initialized!" }
# run Hello
run Print


# require './main.rb'
# require './admin.rb'
# require './m1.rb'
# require './m2.rb'

# map '/' do
#   use m1
#   run Main
# end

# map '/admin' do
#   use m2
#   run Admin
# end
