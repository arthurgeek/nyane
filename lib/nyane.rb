require "rack"

class Nyane

  attr_reader :request, :response

  def initialize(&block)
    @actions = []
    @root = File.dirname(eval("__FILE__", block.binding))
    @app = self
    instance_eval(&block)
  end

  def get(route, &block)
    @actions << [route, :get, block]
  end

  def post(route, &block)
    @actions << [route, :post, block]
  end

  def redirect_to(path)
    @response.status = 302
    @response.headers["Location"] = path
  end

  def load(file)
    path = File.join(@root, file) + ".rb"
    eval(File.read(path), binding, path)
  end

  def call(env)
    @request = Rack::Request.new(env)
    @response = Rack::Response.new
    
    @params = @request.params
    path_info = nil
    action = @actions.detect { |route, method, block| @request.request_method == method.to_s.upcase! && path_info = @request.path_info.match(Regexp.new("^\/?#{route}\/?$")) }

    if action
      @response.write(action.last.call(path_info[1..-1]))
    else
      @response.write("Not found")
      @response.status = 404
    end

    @response.finish
  end

end