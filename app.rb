require "sinatra"

class App < Sinatra::Base
  get "/" do
    erb :index
  end
  get "/blog" do
    erb :blog
  end
end