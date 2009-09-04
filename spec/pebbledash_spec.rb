require File.dirname(__FILE__) + '/spec_helper.rb'

describe Pebbledash do

  before :each do
    @dummy_git = Object.new
    Pebbledash::Git.stub!(:new).and_return(@dummy_git)
  end

  it "should clone a project" do
    @dummy_git.should_receive(:clone).with('remote', '/test/dir')

    Pebbledash.clone('remote', '/test/dir')
  end

  describe "Git status" do
    #TODO: How do we know that @git.status is called within the chdir block?
    it "should get git status" do
      Dir.should_receive(:chdir).with('/test/dir').and_yield()
      @dummy_git.should_receive(:status)

      pebbles = Pebbledash.new('/test/dir')
      pebbles.status
    end
  end

end
