Gem::Specification.new do |s|
  s.date = "Wed Nov 07 04:40:00 -0300 2008"
  s.authors = ["Arthur Zapparoli"]
  s.require_paths = ["lib"]
  s.required_rubygems_version = ">= 0"
  s.has_rdoc = false
  s.files = ["nyane.gemspec",
 "LICENSE",
 "README.markdown",
 "lib/nyane.rb",
 "lib/nyane/erb.rb",
 "demo/example.ru",
 "demo/views/time.erb",
 "demo/views/layout.erb",
 "demo/views/welcome.erb"]
  s.email = ["arthurzap@gmail.com"]
  s.version = "0.0.2"
  s.homepage = "http://github.com/arthurgeek/nyane"
  s.name = "nyane"
  s.summary = "An insignificant rack-based framework"
  s.add_dependency "rack", ">= 0"
end