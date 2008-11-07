begin
  require 'erubis'
rescue LoadError
  require 'erb'
end

class Nyane
  def erb(template)
    path = build_template_path(template, :erb)
    if File.exists?(path)
      if Erubis
        content = Erubis::Eruby.new(File.read(path)).src
      else
        content = ERB.new(File.read(path)).src
      end
      
      eval(content)
    else
      @response.write  "Template not found"
      @response.status = 500
    end
  end
  
  def build_template_path(name, renderer)
    File.join(@root, "/views","/#{name.to_s}.#{renderer.to_s}")
  end
end