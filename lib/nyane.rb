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
  
  private

    def read_template_file(renderer, template, layout=false)
      path = File.join(@root, "/views","/#{template.to_s}.#{renderer.to_s}")

      if File.exists?(path)
        File.read(path)
      else
        raise Errno::ENOENT.new(path) unless layout
      end
    end
    
    def read_layout_file(renderer, options)
      return if options[:layout] == false
      layout_from_options = options[:layout] || :layout
      read_template_file(renderer, layout_from_options, true)
    end

end