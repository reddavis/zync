require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Zync::Logger do
  include EM::SpecHelper

  before do
    @io = StringIO.new
    @logger = Zync::Logger.new(@io)
  end

  describe "#warn" do
    it "should write" do
      em { @logger.debug("warning"); done }
      @io.string.should match(/warning/)
    end
  end

  describe "#debug" do
    it "should write" do
      em { @logger.debug("debug"); done }
      @io.string.should match(/debug/)
    end
  end

  describe "#info" do
    it "should write" do
      em { @logger.info("info"); done }
      @io.string.should match(/info/)
    end
  end

  describe "#fatal" do
    it "should write" do
      em { @logger.fatal("fatal"); done }
      @io.string.should match(/fatal/)
    end
  end
end