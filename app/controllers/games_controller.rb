class GamesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:user_id]
      if is_current_user?(User.find_by(id: params[:user_id]))
        @games = current_user.games.sort_by_title
      else
        flash[:message] =  "Access denied."
        redirect_to games_path
      end
    else
      @games = Game.sort_by_title
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if empty_params?(params[:game][:platform_ids])
      @game.errors.add(:platform, "select at least 1")
    end

    if params[:game][:title].blank?
      @game.errors.add(:title, "cannot be blank")
    end

    if Game.exists_by_title?(params[:game][:title])
      if current_user.owns_game_by_instance?(@game)
        @game.errors.add(:game, "already exists in your collection")
      else
        @game.errors.add(:game, "already exists in the database")
      end
    end

    if @game.errors.empty? && @game.save
      redirect_to new_game_owned_game_path(@game)
    else
      render :new
    end
  end

  def show
    @game = Game.find_by(id: params[:id])
    redirect_to games_path if !@game #todo error

    @owned_game = current_user.find_owned_game_by_game_id(@game.id)
    # @notes = owned_game.notes if owned_game
  end

  def edit
    @game = Game.find_by(id: params[:id])
    if !@game || !current_user.added_game?(@game)
      flash[:message] = "Access denied"
      redirect_to game_path(@game)
    end
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.update(game_params)

    if @game.save
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  private
    def game_params
      params.require(:game).permit(:title, :summary, :image, platform_ids: [])
    end

end
