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

  def edit
    @user = User.find_by(id: params[:user_id])
    redirect_to root_path if !@user || !is_current_user?(@user)
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path if !is_current_user?(@user)
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    session.clear

    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end