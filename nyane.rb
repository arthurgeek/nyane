class Nyane
  
  def initialize(&block)
    @actions = []
    instance_eval(&block)
  end
  
  def get(route, &block)
    @actions << [route, block]
  end
  
  def call(env)    
    action = @actions.detect { |route, block| env["PATH_INFO"].match(Regexp.new("^#{route}$")) }
    
    if action
      [200, {'Content-type' => 'text/html'}, action.last.call]
    else
      [404, {'Content-type' => 'text/plain'}, "Not found"]
    end
  end
  
end