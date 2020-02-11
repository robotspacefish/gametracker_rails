class GamesController < ApplicationController
  def index
    @games = Game.sort_by_title
  end

  def show
    @game = Game.find_by(id: params[:id])
  end
end
