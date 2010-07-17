require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class TestController
end

describe Zync::Router do
  describe "#endpoint" do
    before do
      @router = build_router
    end

    it "should return {:controller => Class, :action => :action}" do
      endpoint = @router.endpoint("test#index")

      endpoint[:controller].should == TestController
      endpoint[:action].should == :index
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