class Game < ApplicationRecord
  has_many :games_platforms
  has_many :platforms, through: :games_platforms
end
