require "sinatra"
require "sinatra/reloader" if development?

class App < Sinatra::Base
  get "/index" do
    erb :index
  end
end