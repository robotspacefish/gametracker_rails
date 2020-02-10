class OwnedGamesController < ApplicationController

  def index
    binding.pry
    if params[:user_id] && user = User.find_by(id: params[:user_id])
      @owned_games = user.owned_games
    else
      # redirect?
    end
  end
end