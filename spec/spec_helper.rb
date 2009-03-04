root = File.expand_path('../../', __FILE__)

frameworks = %w(activesupport activerecord)
rails = [
  File.expand_path('../../rails', root),
  File.expand_path('../rails', root)
].detect do |possible_rails|
  begin
    entries = Dir.entries(possible_rails)
    frameworks.all? { |framework| entries.include?(framework) }
  rescue Errno::ENOENT
    false
  end
end
frameworks.each { |framework| $:.unshift(File.join(rails, framework, 'lib')) }

ENV['RAILS_ENV'] = 'test'

# Rails libs
begin
  require 'active_support'
  require 'active_record'
rescue LoadError
  raise "Please install Attachment-San as Rails plugin before running the tests."
end

logdir = File.join(root, 'log')
FileUtils.mkdir_p(logdir)
ActiveRecord::Base.logger = Logger.new File.join(logdir, 'test.log')
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :dbfile => ':memory:')

require 'rubygems'
require 'bacon'

$:.unshift File.join(root, 'lib')
$:.unshift File.join(root, 'spec')
require File.join(root, 'rails/init')

$:.unshift File.join(root, 'spec', 'lib')
require 'schema'

# get a summary of errors raised and such
Bacon.summary_on_exit