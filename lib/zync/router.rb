module Zync
  class Router

    attr_reader :routes

    def initialize(&block)
      @routes = {}
      build_routes(&block)
    end

    def build_routes(&block)
      instance_eval(&block)

      # Add route for /favicon.ico crap
      @routes['/favicon.ico'] = proc { [200, {}, []] }
    end

    def match(route, options={})
      @routes[route.keys.first] = endpoint(route.values.first)
    end

    def endpoint(destination)
      controller_name, action_name = destination.split('#')
      action_name ||= 'index'
      controller = controller_klass(controller_name)
      { :controller => controller, :action => action_name.to_sym }
    end

    def controller_klass(controller_name)
      # TODO: add rescue and mention the class cannot be found
      eval((controller_name.split('_') + ['controller']).map {|x| x.capitalize}.join(''))
    end

    def call(env)
      endpoint = @routes[env['REQUEST_PATH']]

      if endpoint.nil?
        not_found.call(env)
      elsif endpoint.respond_to?(:call)
        endpoint.call(env)
      else
        endpoint[:controller].call(env, endpoint[:action])
      end

      # whats a better way to handle the /favicon.ico crap?
    end

    def not_found
      proc {|env| [404, {'Content-Type' => 'text/plain'}, 'Not found'] }
    end

  end
end



__END__

begin
  require 'http_router'
rescue LoadError => ex
  STDERR.puts ex.message
  STDERR.puts "Zync::Application depends on the HttpRouter library"
  exit!
end

module Zync
  class Router

    attr_reader :routes

    def initialize(&block)
      @routes = HttpRouter.new(&block)
    end

    def call(env)
      @routes.call(env)
    end

  end
end

