class Router
  def initializer
    @routes = {}
  end

  def match
    @routes.update route
  end

  def routes
    yield
    p routes
  end
end

Router.new.routes do
  match "/users" => "users#index"
  match "/login" => "sessions#new"
end
