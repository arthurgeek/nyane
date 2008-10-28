class Nyane
  
  def initialize(&block)
    @actions = []
    instance_eval(&block)
  end
  
  def get(route, &block)
    @actions << [route, block]
  end
  
  def erb(template)
    begin
      require 'erubis'
      require 'erb'
    rescue LoadError
      next
    end
    
    path = build_template_path(template, :erb)
    if File.exists?(path)
      if Erubis
        content = Erubis::Eruby.new(File.read(path)).src
      else
        content = ERB.new(File.read(path)).src
      end
      
      render_success eval(content)
    else
      render_error 500, "Template not found"
    end
  end
  
  def build_template_path(name, renderer)
    File.join(".", "/views","/#{name.to_s}.#{renderer.to_s}")
  end
  
  def render_success(body,status_code=200,content_type='text/html')
    [status_code, {'Content-type' => content_type}, body]
  end
  
  def render_error(error_code=404, error_message='Not found')
    [error_code, {'Content-type' => 'text/plain'}, error_message]
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
  
end