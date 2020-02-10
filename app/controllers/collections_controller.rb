class CollectionsController < ApplicationController

  def index
    if params[:user_id] && user = User.find_by(id: params[:user_id])
      @collections = user.collections
    else
      # redirect?
    end
  end
end