require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
# require 'rake/gempackagetask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "power_reviews"
    gemspec.summary = "Helps integrate Power Reviews into a rails site"
    gemspec.description = "Tools and library for integrating Power Reviews into a rails website."
    gemspec.email = "beaucollins@gmail.com"
    gemspec.homepage = "http://github.com/beaucollins/power_reviews"
    gemspec.authors = ["Beau Collins"]
    gemspec.add_runtime_dependency 'javan-whenever'
    gemspec.add_runtime_dependency 'fastercsv' 
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end


desc 'Default: run unit tests.'
task :default => :test

desc 'Test the power_reviews plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the power_reviews plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'PowerReviews'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end



# PKG_FILES = FileList[
#   '[a-zA-Z]*',
#   'generators/**/*',
#   'lib/**/*',
#   'rails/**/*',
#   'test/**/*'
# ]
# 
# spec = Gem::Specification.new do |s|
#   s.name = 'power_reviews'
#   s.version = "0.0.1"
#   s.author = 'Beau Collins'
#   s.email = 'beau_collins@k2sports.com'
#   s.homepage = 'http://k2sports.com'
#   s.platform = Gem::Platform::RUBY
#   s.summary = s.description = "Helps integrate Power Reviews into a rails site"
#   s.files = PKG_FILES.to_a
#   s.require_path = "lib"
#   s.has_rdoc = false
#   s.extra_rdoc_files = ['README']
#   s.add_runtime_dependency 'javan-whenever' # this is a github gem
#   s.add_runtime_dependency 'fastercsv'
# end

# desc "Turn this plugin into a a gem."
# Rake::GemPackageTask.new(spec) do |pkg|
#   pkg.gem_spec = spec
# end