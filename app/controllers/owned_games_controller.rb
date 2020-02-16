class OwnedGamesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @game = Game.find_by(id: params[:game_id])

    if !@game
      flash[:message] = "Game does not exist"
      redirect_to games_path
    end

    if current_user.owns_game_by_instance?(@game)
      flash[:message] = "You already own this game"
      redirect_to game_path(@game)
    end
  end

  def create
    # todo require a platform select
    success = OwnedGame.create_owned_games_from_params(params[:owned_game], current_user.id)

    if !success
      flash[:message] = "Select at least 1 platform"
      @game = Game.find_by(id: params[:owned_game][:game_id])
      render :new
      return
    end

    redirect_to user_games_path(current_user)
  end

  def edit
    @owned_game = OwnedGame.find_by(user_id: current_user.id, game_id: params[:id])
  end

  def update
    binding.pry
  end

  def destroy
    @game = Game.find_by(id: params[:id])
    if @game && current_user.owns_game_by_instance?(@game)
      current_user.delete_from_collection(@game)
    end

    redirect_to user_games_path(current_user)
  end

  private
    def owned_game_params
      params.require(:owned_game).permit(:currently_playing, :want_to_play, :completed, :game_id, platform_ids: [])
    end
end