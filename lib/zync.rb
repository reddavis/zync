require 'eventmachine'
require 'rack'
# require 'async-rack'

require 'active_support/core_ext'

module Zync
  VERSION = '0.0.1'

  autoload :Application,  'zync/application'
  autoload :Logger,       'zync/logger'
  autoload :Router,       'zync/router'

  autoload :Controller,   'zync/controller'
  autoload :Callbacks,    'zync/callbacks'
  autoload :Body,         'zync/body'

  class << self
    attr_accessor :application, :logger

    def config
      application && application.config
    end

    def root
      # application && application.config.root
      ZYNC_ROOT
    end

    def env
      @env ||= ENV['RACK_ENV'] || 'development'
    end
  end
end
