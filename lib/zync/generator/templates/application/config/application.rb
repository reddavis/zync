require File.expand_path('../boot', __FILE__)

# Load Zync framework:
require 'zync'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default) if defined?(Bundler)

module ZyncExample
  class Application < Zync::Application
  end
end
