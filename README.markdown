Nyane
===

* [http://github.com/arthurgeek/nyane](http://github.com/arthurgeek/nyane)

DESCRIPTION:
------------

Nyane means insignificant in [Sesotho](http://en.wikipedia.org/wiki/Sesotho), a [Bantu Language](http://en.wikipedia.org/wiki/Bantu_languages). 

As it's name says, Nyane is an insignificant framework. It was build for educational purposes only. It's not intended to be used in production. 

Nyane is based on [Invisible](http://github.com/macournoyer/invisible/) (a nice pico-framework Rack-based) but way simpler.

INSTALLATION:
-------------

	git clone git://github.com/arthurgeek/nyane.git
	cd nyane
	gem build nyane.gemspec
	sudo gem install nyane --local

or

	sudo gem install arthurgeek-nyane --source=http://gems.github.com

DEMO APP:
------

	require "rubygems"
	require "nyane"
	
	app = Nyane.new do
	  get "/" do
	    "Hello!"
	  end
	  
	  get "/bye" do
	    "Goodbye"
	  end
	  
	  get "/echo/(.*)" do |text|
	    "#{text}"
	  end
	  
	end

	run app

ERB SUPPORT:
-------

Nyane supports ERB, but you need to explicitly require it

	require "rubygems"
	require "nyane"
	require "nyane/erb"
	
	app = Nyane.new do
	  get "/" do
	    erb :index
	  end
	  
	  get "/foo" do
	    erb :foo, :layout => false
	  end
	  
	end
	
	run app

The views need to be at `views/` or you can specify it with `app.views_directory = "directory_of_views"`. The layout used is `views/layout.erb`. To not render a layout, use `erb :template, :layout => false`. You can also tell which layout to use with `erb :template, :layout => :layout`

RUNNING THE APP:
-------

The app itself is a Rack config file, so, you can run with: `rackup demo.ru` and view it at `http://localhost:9292` or with Thin: `thin start -R demo.ru`

The extension needs to be .ru (rack config file)

MAINTAINER
----------
 
* Arthur Zapparoli ([http://arthurgeek.net](http://arthurgeek.net))

LICENSE:
--------

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.