# So that the installed throttle gem doesnt interfere
$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../lib"))

require 'rubygems'
require "spec"
require 'spec/autorun'
require "rack/test"
require "zync"

Spec::Runner.configure do |config|

end