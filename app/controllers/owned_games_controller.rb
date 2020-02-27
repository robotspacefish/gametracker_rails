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
    # set up relationships between the user and game and user and games_platforms
    # return true/false if successful or not
    success = OwnedGame.create_owned_games_from_params(params[:owned_game], current_user.id)

    if !success
      flash[:message] = "Select at least 1 platform"

      # set the game up for the re-render
      @game = Game.find_by(id: params[:owned_game][:game_id])
      render :new
      return
    end

    redirect_to user_games_path(current_user)
  end

  def update
    @owned_game = OwnedGame.find_by(id: params[:id])
    @game = Game.find_by(id: params[:owned_game][:game_id])

    if @owned_game.game == @game && valid_status?
      @owned_game.update(status: params[:commit])
      @owned_game.save
    else
      flash[:message] = "Invalid Status Type."
    end

    redirect_to game_path(@game)
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
      params.require(:owned_game).permit(:status, :game_id, platform_ids: [])
    end

    def valid_status?
      # valid statuses are "Want To Play", "Currently Playing", "Completed"
      # Checking for validity against a malicious user altering the html
      OwnedGame.statuses.include?(params[:commit])
    end
end