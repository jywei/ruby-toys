class Router
  def initialize
    @routes = {}
  end

  def match(route)
    # @routes.update route
    @routes.merge! route
  end

  def routes(&the_proc)
    # yield
    instance_eval(&the_proc)  #proc to block
    p @routes
  end
end

Router.new.instance_eval { p @routes }

# <= main:Object

Router.new.routes do          #simple DSL
  match "/users" => "users#index"
  match "/login" => "sessions#new"
end
