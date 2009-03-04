require 'rake'
require 'rake/rdoctask'
require 'rake/testtask'

task :default => :test

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "formatter-san"
    s.summary = %Q{TODO}
    s.email = "manfred@fngtps.com"
    s.homepage = "http://github.com/Manfred/formatter-san"
    s.description = "TODO"
    s.authors = ["Manfred Stienstra"]
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


