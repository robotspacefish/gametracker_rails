class NotesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    # find owned game by game_id
    @game = Game.find(params[:game_id])
    if owned_game = current_user.find_owned_game_by_game_id(params[:game_id])
      @note = Note.new
    else
      redirect_to games_path
    end
  end

  def create
    game = Game.find_by(id: params[:game_id])

    @owned_game = current_user.find_owned_game_by_game_id(params[:game_id])
      @note = @owned_game.notes.build(note_params)

    if @note.save
      redirect_to game_path(game)
    else
      render :new
    end
  end

  private
    def note_params
      params.require(:note).permit(:title, :content, :completed)
    end

end
