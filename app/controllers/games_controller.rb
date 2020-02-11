class GamesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @games = Game.sort_by_title
  end

  def show
    @game = Game.find_by(id: params[:id])
    redirect_to games_path if !@game #todo error

    # is game owned?

    # if so, display owner information (notes, status, etc)
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
      params.require(:game).permit(:title, :summary)
    end

end
