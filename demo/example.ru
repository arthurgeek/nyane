require "nyane"

app = Nyane.new do
  get "/" do
    "Hello!"
  end
  
  get "/bye" do
    "Goodbye"
  end
  
  get "/time" do
    @now = Time.now
    erb :time
  end
  
  get "/echo/(.*)" do |text|
    "#{text}"
  end
  
  get "/say/(.*)/to/(.*)" do |message, person|
    "#{message} #{person}"
  end
  
end

run app