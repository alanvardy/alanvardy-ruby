# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # sleep 2 # you can add sleep here  if you want to  slow down brute force attack
              # for normal application this is bad idea but for one
              # user login no-one care

    user_params = params.permit(:username, :password)

    @user = User.new(user_params[:username], user_params[:password])
      # .tap { |su| su.username = user_params[:username] }
      # .tap { |su| su.password = user_params[:password] }

    if @user.login_valid?
      session[:current_user] = true
      redirect_to posts_path
    else
      @user.password = nil
      flash[:notice] = 'Sorry, wrong credentils'
      render 'new'
    end
  end
end
