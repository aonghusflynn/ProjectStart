Gem::Specification.new do |s|
  s.name        = 'start_project'
  s.version     = '0.0.1'
  s.date        = '2012-08-24'
  s.summary     = "Create html 5 projects"
  s.description = File.read(File.join(File.dirname(__FILE__),'README.md' )
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Aonghus Flynn"]
  s.email       = 'developer@aonghusflynn.com'
  s.files       = ["**/**"]
  s.homepage    = 'http://rubygems.org/gems/start_project'
  s.add_dependency('rubyzip')
  s.required_ruby_version = '>=1.8.7'
end
