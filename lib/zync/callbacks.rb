module Zync
  module Callbacks
  end
end

__END__

module Zync
  module Callbacks
    
    def self.included(base)
      base.send :extend, ClassMethods
      base.send :include, InstanceMethods
      
      base.instance_eval do
        class << self
          attr_accessor :before_header_callback
        end
      end

    end
    
    module ClassMethods
      def before_header(method)
        self.before_header_callback = method
      end
    end
    
    module InstanceMethods
      def before_header
        callback = self.class.before_header_callback
        
        if !callback.nil?
          self.send(method)
        else
          init_response
        end
        
        # callbacks = self.class.before_header_callbacks
        # callbacks.each do |callback|
        #   method = callback.first
        #   
        #   debugger
        #   a = 1
        #   
        #   send(method)
        # 
        #   # TODO: expand on the :only etc. stuff
        #   # EM.next_tick { send(method) }
        # end if !callbacks.nil?
        # 
        # continue
      end
    end
    
  end
end