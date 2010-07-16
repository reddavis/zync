require 'rubygems'

# root = File.expand_path('../../', __FILE__)
ZYNC_ROOT = File.expand_path('../../', __FILE__)

# Set up gems listed in the Gemfile.
gemfile = "#{ZYNC_ROOT}/Gemfile"
begin
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup
rescue Bundler::GemNotFound => e
  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end if File.exist?(gemfile)

# Load libraries in the vendor directory
vendor_path = "#{ZYNC_ROOT}/vendor"
Dir.entries(vendor_path).each do |vendor|
  vendor_lib = "#{vendor_path}/#{vendor}/lib"
  if File.directory?(vendor_lib) && vendor != '..'
    $:.unshift vendor_lib
  end
end if File.exists?(vendor_path)
