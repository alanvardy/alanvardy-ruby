require "sinatra"
class App < Sinatra::Base
  get "/" do
    "This is a test"
  end
end