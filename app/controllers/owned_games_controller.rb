class OwnedGamesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:user_id] && user = User.find_by(id: params[:user_id])
      @owned_games = user.games_platforms
    else
      # redirect?
    end
  end
end