# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # sleep 2 # you can add sleep here  if you want to  slow down brute force attack
    # for normal application this is bad idea but for one
    # user login no-one care

    user_params = params.require(:user).permit(:username, :password)

    @user = User.new
    @user.username = user_params[:username]
    @user.password = user_params[:password]

    if @user.login_valid?
      session[:current_user] = true
      flash[:success] = 'You have logged in'
      redirect_to root_path
    else
      @user.password = nil
      flash[:notice] = 'Sorry, wrong credentials'
      render 'new'
    end
  end

  def destroy
    reset_session
    flash[:success] = 'You have logged out'
    redirect_to root_path
  end
end
