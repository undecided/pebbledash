class Pebbledash
  def initialize(path)
    unless File.directory? path
      raise(DirectoryNotFoundError,"Cannot find #{path}")
    end
  end

  #The following are likely to become apis to another module...
  def init
    raise(DirectoryAlreadyInitializedError)
  end
end

class DirectoryNotFoundError < Exception; end
class DirectoryAlreadyInitializedError < Exception; end
