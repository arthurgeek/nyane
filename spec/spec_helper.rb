$:.unshift File.dirname(__FILE__) + "/../lib"
require "rubygems"
require "nyane"
require "spec"

class Nyane
  def mock
    @mock ||= Rack::MockRequest.new(@app)
  end
end