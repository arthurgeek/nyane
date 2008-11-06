class Nyane
  
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
    params = nil
    action = @actions.detect { |route, block| params = env["PATH_INFO"].match(Regexp.new("^#{route}$")) }
    
    if action
      result = action.last.call *params[1..-1]
      if result.is_a?(String)
        render_success result
      else
        result
      end
    else
      render_error
    end
  end
  
  private
    def render_success(body,status_code=200,content_type='text/html')
      [status_code, {'Content-type' => content_type}, body]
    end

    def render_error(error_code=404, error_message='Not found')
      [error_code, {'Content-type' => 'text/plain'}, error_message]
    end
  
end