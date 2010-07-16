class HelloController < Zync::Controller
  def index
    render "hello world"
    close
  end
end
