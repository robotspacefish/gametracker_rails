class OwnedGamesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    user = User.find_by(id: params[:user_id])
    if params[:user_id] && user && is_current_user?(user)
      # @owned_games = user.games_platforms
      @owned_games = user.games.distinct

    else
      redirect_to games_path
    end
  end

  def new
    @game = Game.find_by(id: params[:game_id])

    redirect_to games_path if !@game

    @owned_game = OwnedGame.new

  private
    def owned_game_params
      params.require(:owned_game).permit(:currently_playing, :want_to_play, :completed, :game_id, :platform_ids => [])
    end
end