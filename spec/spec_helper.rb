require 'rubygems' unless ENV['NO_RUBYGEMS']
gem 'rspec'
require 'spec'


$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'pebbledash'
