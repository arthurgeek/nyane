require "rack"

class Nyane
  
  attr_reader :request, :response
  
  def initialize(&block)
    @actions = []
    @root = File.dirname(eval("__FILE__", block.binding))
    puts ">> Listening, CTRL+C to stop"
    instance_eval(&block)
  end
  
  def get(route, &block)
    @actions << [route, block]
  end
  
  def call(env)
    @request = Rack::Request.new(env)
    @response = Rack::Response.new

    params = nil
    action = @actions.detect { |route, block| params = env["PATH_INFO"].match(Regexp.new("^#{route}$")) }
    
    if action
      @response.write(action.last.call(*params[1..-1]))
    else
      @response.write("Not found")
      @response.status = 404
    end
    
    @response.finish
    
  end
  
end