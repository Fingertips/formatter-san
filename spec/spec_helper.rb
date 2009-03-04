require 'rubygems'
require 'bacon'

$:.unshift(File.expand_path('../../lib', __FILE__))
require 'formatter_san'
$:.unshift(File.expand_path('../', __FILE__))
require 'formatter_san'

# get a summary of errors raised and such
Bacon.summary_on_exit
