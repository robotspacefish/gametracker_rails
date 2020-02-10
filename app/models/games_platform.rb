class GamesPlatform < ApplicationRecord
  belongs_to :game
  belongs_to :platform

  has_many :collections
  has_many :users, through: :collections
end