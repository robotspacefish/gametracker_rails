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


end
