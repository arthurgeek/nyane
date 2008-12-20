$:.unshift File.dirname(__FILE__) + "/../lib"

require "nyane"
require "nyane/erb"

app = Nyane.new do
  get "/" do
    "Hello!"
  end

  get "/bye" do
    "Goodbye"
  end

  get "/redirect" do
    redirect_to "/"
  end

  get "/time" do
    @now = Time.now
    erb :time
  end

  get "/welcome" do
    erb :welcome, :layout => false
  end

  post '/greeter' do
    @name = @params["name"]
    erb :greeter
  end

  get "/echo/(.*)" do |text|
    "#{text}"
  end

  get "/say/(.*)/to/(.*)" do |message, person|
    "#{message} #{person}"
  end

end

run app