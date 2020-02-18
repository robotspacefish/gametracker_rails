class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create, :home]
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_games_path(user)
    else
      flash[:message] = "Incorrect login information. Please try again"
      redirect_to login_path
    end
  end

  def omniauth
    @user = User.find_or_initialize_by(uid: auth[:uid]) do |u|
      u.username = auth[:info][:email].split('@')[0]
      u.email = auth[:info][:email]
      u.password = SecureRandom.hex
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_games_path(@user)
    else
      flash[:message] = "There's already an account with that email address"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end