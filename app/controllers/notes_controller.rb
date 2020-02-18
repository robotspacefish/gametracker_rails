class NotesController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :find_game_by_game_id, only: [:new, :create]
  before_action :owned_game, only: [:new, :create]
  before_action :find_note, only: [:edit, :update, :destroy]

  def new
    if @owned_game
      @note = Note.new
    else
      flash[:message] = "You need to add the game to your collection before you can add a note"
      redirect_to game_path(@game)
    end
  end

  def create
      @note = @owned_game.notes.build(note_params)
    if @note.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @note.update(note_params)
    if @note.save
      redirect_to game_path(@note.game)
    else
      render :edit
    end
  end

  def destroy
    if @note && @note.belongs_to_user?(current_user)
      @note.destroy
      redirect_to game_path(@note.game)
    else
      flash[:message] = "Note not found."
      redirect_to games_path
    end
  end

  private
    def note_params
      params.require(:note).permit(:title, :content, :completed)
    end

    def find_game_by_game_id
      @game = Game.find(params[:game_id])
    end

    def owned_game
      @owned_game = current_user.find_owned_game_by_game_id(params[:game_id])
    end

    def find_note
      @note = Note.find_by(id: params[:id])
    end
end
