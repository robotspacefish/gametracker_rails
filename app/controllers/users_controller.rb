class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @users = User.sort_by_username
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = user.id
      redirect_to user_collection_path(@user) #todo change
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path if !is_current_user?(@user)
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end