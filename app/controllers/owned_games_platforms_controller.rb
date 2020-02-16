class OwnedGamesPlatformsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update

  end
end