class Platform < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :games_platforms
  has_many :games, through: :games_platforms
end
