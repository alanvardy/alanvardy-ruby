require "sinatra"

class App < Sinatra::Base
  get "/" do
    @title = "Home"
    erb :index
  end
  get "/blog" do
    @title = "Blog"
    erb :blog
  end
  get "/portfolio" do
    @title = "Portfolio"
    erb :portfolio
  end
  get "/resume" do
    @title = "Resume"
    erb :resume
  end
  get "/contact" do
    @title = "Contact"
    erb :contact
  end
end