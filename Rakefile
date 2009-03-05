require 'rake'
require 'rake/rdoctask'
require 'rake/testtask'

task :default => :spec

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "formatter-san"
    s.summary = %Q{When included in a class, Formatter-san allows you to easily define a formatter decorator around an attribute.}
    s.email = "manfred@fngtps.com"
    s.homepage = "http://github.com/Manfred/formatter-san"
    s.description = "Simple plugin to generate a formatter decorator for ActiveRecord attributes."
    s.authors = ["Manfred Stienstra"]
    s.files = %w(lib/formatter_san.rb lib/formatter_san/formatter.rb lib/formatter_san/rubypants.rb rails/init.rb)
  end
end

namespace :docs do
  Rake::RDocTask.new('generate') do |rdoc|
    rdoc.rdoc_dir = 'html'
    rdoc.title = 'formatter-san'
    rdoc.options << '--line-numbers' << '--inline-source' << '--charset' << 'utf-8'
    rdoc.rdoc_files.include('README*')
    rdoc.rdoc_files.include('lib/**/*.rb')
  end
end

Rake::TestTask.new(:spec) do |t|
  t.libs << 'lib' << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = false
end
