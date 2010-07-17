require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    #gem.name = "railslove-rack-throttle"
    #gem.summary = %Q{Extension of rack-throttle - HTTP request rate limiter for Rack applications.}
    #gem.description = %Q{Rack middleware for rate-limiting incoming HTTP requests.}
    #gem.email = "reddavis@gmail.com"
    #gem.homepage = "http://github.com/railslove/rack-throttle"
    #gem.authors = ["Arto Bendiken", "Brendon Murphy", "reddavis"]
    #gem.add_development_dependency "rspec", ">= 1.2.9"
    #gem.add_development_dependency "rack-test", ">= 0.5.3"
    #gem.add_runtime_dependency "rack", ">= 1.0.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Zync #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end