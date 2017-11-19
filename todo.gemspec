# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','todo','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'todo'
  s.version = Todo::VERSION
  s.author = 'Brandon Duff'
  s.email = 'brandonduff17@gmail.com'
  s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Use Cases for Todo'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','todo.rdoc']
  s.rdoc_options << '--title' << 'todo' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('minitest')
  s.add_development_dependency('rspec-mocks')
  s.add_development_dependency('pry')
  s.add_development_dependency('pry-doc')
end
