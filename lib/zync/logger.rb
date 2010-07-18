module Zync
  class Logger < ::Logger

    alias_method :old_warn, :warn
    def warn(message, &block)
      EM.next_tick { old_warn(message, &block) }
    end

    alias_method :old_debug, :debug
    def debug(message, &block)
      EM.next_tick { old_debug(message, &block) }
    end

    alias_method :old_info, :info
    def info(message, &block)
      EM.next_tick { old_info(message, &block) }
    end

    alias_method :old_fatal, :fatal
    def fatal(message, &block)
      EM.next_tick { old_fatal(message, &block) }
    end

  end
end
