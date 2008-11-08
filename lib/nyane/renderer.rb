class Nyane

  attr_accessor :views_directory

  private

    def read_template_file(renderer, template, layout=false)
      self.views_directory ||= "views"
      path = File.join(@root, self.views_directory,"/#{template.to_s}.#{renderer.to_s}")

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