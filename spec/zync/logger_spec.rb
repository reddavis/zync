require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'tempfile'

describe Zync::Logger do
  include EM::SpecHelper

  before do
    @io = Tempfile.new("test")
    @logger = Zync::Logger.new(@io.path)
  end

  describe "#warn" do
    it "should write" do
      em { @logger.debug("warning"); done }
      @io.read.should match(/warning/)
    end
  end

  describe "#debug" do
    it "should write" do
      em { @logger.debug("debug"); done }
      @io.read.should match(/debug/)
    end
  end

  describe "#info" do
    it "should write" do
      em { @logger.info("info"); done }
      @io.read.should match(/info/)
    end
  end

  describe "#fatal" do
    it "should write" do
      em { @logger.fatal("fatal"); done }
      @io.read.should match(/fatal/)
    end
  end
end