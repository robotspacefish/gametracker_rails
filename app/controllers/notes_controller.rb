class NotesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    # find owned game by game_id
    @game = Game.find(params[:game_id])
    if owned_game = current_user.find_owned_game_by_game_id(params[:game_id])
      @note = Note.new
    else
      flash[:message] = "You need to add the game to your collection before you can add a note"
      redirect_to game_path(@game)
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

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.update(note_params)
    if @note.save
      redirect_to game_path(@note.game)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    if @note && @note.belongs_to_user?(current_user)
      @note.destroy
      redirect_to game_path(@note.game)
    else
      #todo change redirect path
      flash[:message] = "Note not found."
      redirect_to games_path
    end
  end

  private
    def note_params
      params.require(:note).permit(:title, :content, :completed)
    end

end
