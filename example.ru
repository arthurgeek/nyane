require "nyane"

app = Nyane.new do
  get "/" do
    "Hello!"
  end
  
  get "/hello" do
    @now = Time.now
    erb :hello
  end
  
  get "/bye" do
    "Goodbye"
  end
  
  get "/echo/(.*)" do |text|
    "#{text}"
  end
  
  get "/say/(.*)/to/(.*)" do |message, person|
    "#{message} #{person}"
  end
  
end

run app