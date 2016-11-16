class Timing
  def initialize(app, opts = {}, &b)
    @app = app
    @pid = opts[:pid]
    yield if block_given?
  end

  def call(env)
    ts = Time.now
    status, headers, body = @app.call(env)
    elapsed_time = Time.now - ts
    puts "Timing: #{Process.pid if @pid} #{env['REQUEST_METHOD']} #{env['REQUEST_URI']} #{elapsed_time.round(3)}"
    return [status, headers, body]
  end
end
