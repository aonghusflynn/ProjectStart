Gem::Specification.new do |s|
  s.name        = 'start_project'
  s.version     = '0.0.3'
  s.date        = '2012-08-24'
  s.summary     = "Create html projects"
  s.description = File.read(File.join(File.dirname(__FILE__),'README' ))
  s.authors     = ["Aonghus Flynn"]
  s.email       = 'developer@aonghusflynn.com'
  s.files       = ["lib/start_project/downloader.rb","lib//start_project/options.rb","lib//start_project/runner.rb","bin/ProjectStart"]
  s.homepage    = 'http://rubygems.org/gems/start_project'
  s.add_dependency('rubyzip')
  s.required_ruby_version = '>=1.8.7'
  s.executables << 'ProjectStart'
end
