Gem::Specification.new do |s|
  s.date = "Wed Oct 28 02:21:17 -0300 2008"
  s.authors = ["Arthur Zapparoli"]
  s.require_paths = ["lib"]
  s.required_rubygems_version = ">= 0"
  s.has_rdoc = false
  s.files = ["nyane.gemspec",
 "LICENSE",
 "README.markdown",
 "lib/nyane.rb",
 "demo/example.ru",
 "demo/views/time.erb"]
  s.email = ["arthurzap@gmail.com"]
  s.version = "0.0.1"
  s.homepage = "http://github.com/arthurgeek/nyane"
  s.name = "nyane"
  s.summary = "An insignificant framework"
  s.add_dependency "rack", ">= 0"
end