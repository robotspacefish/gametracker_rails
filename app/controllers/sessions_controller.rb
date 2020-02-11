class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_collection_path(user)
    else
      flash[:message] = "Incorrect login information. Please try again"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end