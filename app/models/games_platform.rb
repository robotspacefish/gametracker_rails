class GamesPlatform < ApplicationRecord
  belongs_to :game
  belongs_to :platform

  has_many :owned_games
  has_many :users, through: :owned_games

  def self.find_by_ids(g_id, p_id)
    GamesPlatform.find_by(game_id: g_id, platform_id: p_id)
  end
end