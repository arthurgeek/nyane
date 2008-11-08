require File.dirname(__FILE__) + "/spec_helper"

describe "routing" do
  before do
    @app = Nyane.new do
      get "/path" do
        "/path"
      end

      get "/param/(.*)" do |name|
        "#{name}"
      end

      get "/" do
        "/"
      end

      get "no/slash" do
        "no-slash"
      end

      get "/echo/(.*)" do |text|
        "#{text}"
      end
    end
  end

  it "should route /" do
    @app.mock.get("/").body.should == "/"
  end

  it "should return 404 when no route" do
    @app.mock.get("/no-route").status.should == 404
  end

  it "should route /path" do
    @app.mock.get("/path").body.should == "/path"
  end

  it "should route /param/:param" do
    @app.mock.get("/param/ohaie").body.should == "ohaie"
  end

  it "should route with no leading slash" do    
    @app.mock.get("/no/slash").body.should == "no-slash"
  end

  it "should route ignore trailing slash" do    
    @app.mock.get("/no/slash/").body.should == "no-slash"
  end

  it "should match parameters from route" do
    @app.mock.get("/echo/hello").body.should == "hello"
    @app.mock.get("/echo/any-text").body.should == "any-text"
  end
end