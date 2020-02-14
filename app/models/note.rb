class Note < ApplicationRecord
  belongs_to :owned_game

  scope :sort_newest_first, -> { order(created_at: :desc)}

  def belongs_to_user?(user)
    self.owned_game.user_id == user.id
  end

  def game
    Game.find_by(id: self.owned_game.game_id)
  end
end