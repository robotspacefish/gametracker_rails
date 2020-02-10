class User < ApplicationRecord
  has_secure_password

  has_many :owned_games
  has_many :games_platforms, through: :owned_games
end