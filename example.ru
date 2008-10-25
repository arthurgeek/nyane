require "nyane"

app = Nyane.new do
  get "/" do
    "Hello!"
  end
  
  get "/hello" do
    "Hello, hello, hello!"
  end
  
  get "/bye" do
    "Goodbye!"
  end
end

run app