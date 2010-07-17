require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class TestController;end;
class TestTwoController;end;

describe Zync::Router do
  it "should add /favicon.ico by default" do
    build_router.routes["/favicon.ico"].should_not be_nil
  end

  describe "#endpoint" do
    it "should return {:controller => Class, :action => :action}" do
      endpoint = build_router.endpoint("test#index")

      endpoint[:controller].should == TestController
      endpoint[:action].should == :index
    end

    describe "No action passed" do
      it "should default action to #index" do
        endpoint = build_router.endpoint("test")
        endpoint[:action].should == :index
      end
    end
  end

  describe "#controller_class" do
    describe "class exists" do
      it "should return a Class" do
        build_router.controller_klass("test").should == TestController
      end
    end

    describe "class does not exist" do
      it "should raise an error" do
        lambda { build_router.controller_klass("failz") }.should raise_error
      end
    end
  end

  describe "Adding routes" do
    before do
      @router = build_router
    end

    it "should add route to /test" do
      @router.match("/test" => "test_two#show")
      @router.routes["/test"].should be_a(Hash)
    end
  end

  private

  def build_router(routes = test_routes)
    Zync::Router.new(&routes)
  end

  def test_routes
    lambda { match '/' => "test#index" }
  end
end