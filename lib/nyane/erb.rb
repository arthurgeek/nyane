begin
  require "erubis"
rescue LoadError
  require "erb"
end

class Nyane
  def erb(template)
    path = build_template_path(template, :erb)
    if File.exists?(path)
      if Erubis
        content = Erubis::Eruby.new(File.read(path))
      else
        content = ERB.new(File.read(path))
      end

      eval(content.src)
    else
      @response.write  "Template not found"
      @response.status = 500
    end
  end
end