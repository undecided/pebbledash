require File.join(File.dirname(__FILE__), '../lib/pebbledash')

describe Pebbledash do
  describe "instantiation" do
    it "should take a foldername" do
      Pebbledash.new('.')
    end

    it "should throw an exception if the given folder does not exist" do
      lambda {
        Pebbledash.new('nonexistant_folder_name')
      }.should raise_error(DirectoryNotFoundError)
    end
  end

  describe "git init" do
    it "should baulk if there is already a git directory there" do
      # Let's make use of the fact that this project is in git!
      # Doesn't sound toooo dangerous...
      folder = File.join(File.dirname(__FILE__), '..')
      p = Pebbledash.new(folder)

      lambda {
        p.init
      }.should raise_error(DirectoryAlreadyInitializedError)
    end

    it "should not baulk if this folder does not have a git directory" do
      folder = File.dirname(__FILE__)
      p = Pebbledash.new(folder)

      lambda {
        p.init
      }.should_not raise_error(DirectoryAlreadyInitializedError)
    end
  end
end
