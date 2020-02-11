class User < ApplicationRecord
  has_secure_password

  validates :username, :email, presence: true, uniqueness: { case_sensitive: false }

  has_many :owned_games
  has_many :games_platforms, through: :owned_games

   scope :sort_by_username, -> { order(:username) }
end