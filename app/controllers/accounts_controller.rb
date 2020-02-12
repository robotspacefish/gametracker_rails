class AccountsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @user = User.find_by(id: params[:user_id])
    redirect_to root_path if !@user || !is_current_user?(@user)
  end
end