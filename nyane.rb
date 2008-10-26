class Nyane
  
  def initialize(&block)
    @actions = []
    instance_eval(&block)
  end
  
  def get(route, &block)
    @actions << [route, block]
  end
  
  def render(template)
    require 'erb'
    path = File.join(".", "/views","/#{template.to_s}.erb")
    if File.exists?(path)
      content = ERB.new(File.read(path)).src
      render_success(eval(content))
    else
      render_error 500, "Template not found"
    end
  end
  
  def render_success(body,status_code=200,content_type='text/html')
    [status_code, {'Content-type' => content_type}, body]
  end
  
  def render_error(error_code=404, error_message='Not found')
    [error_code, {'Content-type' => 'text/plain'}, error_message]
  end
  
  def call(env)    
    action = @actions.detect { |route, block| env["PATH_INFO"].match(Regexp.new("^#{route}$")) }
    
    if action
      result = action.last.call
      if result.is_a?(String)
        render_success result
      else
        result
      end
    else
      render_error
    end
  end
  
end