module Zync

  class Application
    class << self
      def instance
        Zync.application ||= new
      end
      
      def configure(&block)
        class_eval(&block)
      end
            
      protected
      
        def method_missing(*args, &block)
          instance.send(*args, &block)
        end
    end
    
    def initialize!
      # TODO: really clean this up and refactor
      # What would Rails do?
      load_app
      self
    end
    
    def call(env)
      router.call(env)
    end
    
    def router(&block)
      return @router if !block_given?
      @router ||= Router.new(&block)
    end
    
    def load_app
      load_folder "#{Zync.root}/app/controllers"
      load_folder "#{Zync.root}/lib"
      load_folder "#{Zync.root}/config/initializers"
      load_routes
    end
    
    def load_routes
      require "#{Zync.root}/config/routes"
    end
    
    protected
    
      def load_folder(path)
        Dir.entries(path).each do |lib_file|
          if lib_file != '.' && lib_file != '..'
            require "#{path}/#{lib_file}"
          end
        end if File.exists?(path)
      end
    
    # class Configuration
    # end
    
  end
  
end
