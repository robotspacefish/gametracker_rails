class GamesPlatform < ApplicationRecord
  belongs_to :game
  belongs_to :platform

  has_many :games_platforms_users
  has_many :users, through: :games_platforms_users
end