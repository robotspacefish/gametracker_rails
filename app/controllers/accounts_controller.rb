class AccountsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @user = User.find_by(id: params[:user_id])
    redirect_to root_path if !@user || @user != current_user
  end
end