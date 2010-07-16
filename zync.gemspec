version = File.read("VERSION").strip

Gem::Specification.new do |s|
  s.name        = 'zync'
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Lightweight asynchronous Ruby web framework"
  s.description = "Lightweight asynchronous Ruby web framework"
  
  s.authors     = ["Peter Kieltyka"]
  s.email       = ["peter@nulayer.com"]
  s.homepage    = "http://github.com/nulayer/zync"

  s.files        = Dir['README', 'VERSION', 'lib/**/*']
  s.require_path = 'lib'
end

