require 'rack'
require './timing.rb'

app = proc do |env|
  ['200', {'Content-Type' => 'text/html'}, ['Hello, Rack!']]
end

Rack::Handler::WEBrick.run(Timing.new(app), :Port => 8090, :Host => '0.0.0.0')
