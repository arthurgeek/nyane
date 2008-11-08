require File.dirname(__FILE__) + "/spec_helper"
require "nyane/erb"

describe "erb" do

  describe "with default layout file" do

    before do
      @app = Nyane.new do
        get "/" do
          @var = "my_var"
          erb :text, :layout => false
        end

        get "/layout" do
          @var = "my_var"
          erb :text
        end

        get "/my_layout" do
          @var = "my_var"
          erb :text, :layout => :my_layout
        end
      end

      @app.views_directory = "fixtures/with_layout"

    end

    it "should render erb template with layout option as false" do
      @app.mock.get("/").body.should == "my_var"
    end

    it "should render erb template with default layout" do
      @app.mock.get("/layout").body.should == "<h1>my_var</h1>"
    end

    it "should render erb template with specified layout" do
      @app.mock.get("/my_layout").body.should == "<h2>my_var</h2>"
    end
  end

  describe "without default layout file" do

    before do
      @app = Nyane.new do
        get "/" do
          @var = "Nyane"
          erb :index
        end
      end

      @app.views_directory = "fixtures/without_layout"
    end

    it "should render erb template" do
      @app.mock.get("/").body.should == "Nyane"
    end
  end
end