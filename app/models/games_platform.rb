class GamesPlatform < ApplicationRecord
  belongs_to :game
  belongs_to :platform

  has_many :owned_games
  has_many :users, through: :owned_games
end