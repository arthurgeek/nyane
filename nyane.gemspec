Gem::Specification.new do |s|
  s.date = "Wed Dec 20 04:44:00 -0300 2008"
  s.authors = ["Arthur Zapparoli"]
  s.require_paths = ["lib"]
  s.required_rubygems_version = ">= 0"
  s.has_rdoc = false
  s.files = ["nyane.gemspec",
 "LICENSE",
 "Rakefile",
 "README.markdown",
 "lib/nyane.rb",
 "lib/nyane/renderer.rb",
 "lib/nyane/erb.rb",
 "demo/example.ru",
 "demo/views/time.erb",
 "demo/views/layout.erb",
 "demo/views/welcome.erb",
 "demo/views/greeter.erb",
 "spec/app_spec.rb",
 "spec/erb_spec.rb",
 "spec/routing_spec.rb",
 "spec/spec_helper.rb",
 "spec/fixtures/with_layout/layout.erb",
 "spec/fixtures/with_layout/my_layout.erb",
 "spec/fixtures/with_layout/text.erb",
 "spec/fixtures/without_layout/index.erb"]
  s.email = ["arthurzap@gmail.com"]
  s.version = "0.0.4"
  s.homepage = "http://github.com/arthurgeek/nyane"
  s.name = "nyane"
  s.summary = "An insignificant rack-based framework"
  s.add_dependency "rack", ">= 0"
end