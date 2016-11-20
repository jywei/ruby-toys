require 'rack'

app = proc do |env|
  env.to_a.sort_by {|e| e[0] }.each {|k, v| puts %Q(#{k}=#{v}) }
  [200, {}, []]
end

Rack::Handler::WEBrick.run(app, Port: 8090)
