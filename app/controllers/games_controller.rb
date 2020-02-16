class GamesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:user_id]
      if is_current_user?(User.find_by(id: params[:user_id]))
        @games = current_user.games
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
    if @game = Game.where("LOWER(title) LIKE ?", params[:game][:title]).take
      if current_user.owns_game_by_instance?(@game)
        flash[:message] = "You already own #{@game.title}."
      else
        flash[:message] = "#{@game.title} already exists. You can add it here."
      end

      redirect_to game_path(@game)
    else
      @game = Game.new(game_params)
      @game.custom = true

      if @game.save!
        # add to user's collection
        current_user.games << @game

        @game.platforms.each do |p|
          current_user.add_games_platform_by_game_and_platform(@game, p)
        end

        flash[:message] = "Successfully added #{@game.title} to your collection"
        redirect_to game_path(@game)
      else
        flash[:message] = "failed to add game to database"
        render :new
      end
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
    redirect_to games_path if !@game || !@game.custom #todo error
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
