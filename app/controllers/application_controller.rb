class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      redirect_to root_path if !logged_in?
    end

    def is_current_user?(user)
      user == current_user
    end

    def empty_params?(params)
      params.filter { |p| !p.blank? }.empty?
    end


end
