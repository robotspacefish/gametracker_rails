class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :owned_games
  has_many :games_platforms, through: :owned_games
end