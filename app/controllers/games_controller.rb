class GamesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @games = Game.sort_by_title
  end

  def show
    @game = Game.find_by(id: params[:id])
  end
end
