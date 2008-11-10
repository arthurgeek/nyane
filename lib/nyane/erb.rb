begin
  require "erubis"
rescue LoadError
  require "erb"
end

require "nyane/renderer"

class Nyane

  def erb(template, options={})
    file = read_template_file(:erb, template)
    layout = read_layout_file(:erb, options)

    result = process(file)
    result = process(layout) { result } if layout

    result
  end

  private
    def process(template)
      begin
        if Erubis
          body = Erubis::Eruby.new(template).src
          erubis = true
        end
      rescue NameError
        puts 'Erubis not present'
      end
      if !erubis
        body = ERB.new(template).src
      end

      eval(body,binding)
    end
end