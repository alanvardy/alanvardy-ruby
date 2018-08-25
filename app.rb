require "sinatra"
require "sinatra/reloader" if development?

class App < Sinatra::Base
  get "/" do
    erb :index
  end
end