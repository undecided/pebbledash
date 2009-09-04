require 'rubygems' unless ENV['NO_RUBYGEMS']
gem 'rspec'
require 'spec'


$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'pebbledash'


#Rather than stubbing git out, we'll simply redefine it
#We never ever ever want to call the real system git...
class Pebbledash::Git; def method_missing(*args); end; end
