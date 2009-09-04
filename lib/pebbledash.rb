$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# TODO: I would love this to use grit, or
# some pure-ruby git implementation.
#require 'grit'


class Pebbledash
  VERSION = '0.0.1'
  attr_accessor :git

  def initialize(folder)
    @git = Git.new
    @folder = folder
  end

  def self.clone(remote_dir, local_dir)
    Git.new.clone(remote_dir, local_dir)
  end

  def status
    Dir.chdir(@folder) do
      @git.status
    end
  end

  class Git
    def method_missing(method, *args)
      `git #{method} #{args.join(' ')}`
    end
  end
end
PebbleDash = Pebbledash # I keep wanting to use both anyway...
