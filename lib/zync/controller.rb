module Zync

  class Controller
    include Callbacks
    
    ASYNC_RESPONSE = [-1, {}, []].freeze

    def self.call(env, action=nil)
      new(env, action).process
    end
    
    def self.action(method)
      proc {|env| self.call(env, method) }
    end

    def initialize(env, action=nil)
      @env = env
      @action = action || :index
    end

    def process
      @body = Body.new
      
      status, headers = respond_with
      send_header(status, headers, @body)
      EM.next_tick { self.send(@action) }
      
      ASYNC_RESPONSE
    end
    
    def send_header(status, headers, body)
      EM.next_tick { @env['async.callback'].call [status, headers, body] }
    end
    
    def respond_with
      [200, {'Content-Type' => 'text/html'}]
    end
    
    def render(data)
      @body.call [data]
    end
    
    def close
      @body.succeed
    end
    
    def request
      @request ||= Rack::Request.new(@env)
    end
    
    def params
      @params ||= request.params
    end
  end
  
end
