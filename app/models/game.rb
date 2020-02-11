class Game < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  has_many :games_platforms
  has_many :platforms, through: :games_platforms

  scope :sort_by_title, -> { order(:title) }

  def is_owned?
    !!GamesPlatform.joins(:owned_games).find_by(game_id: self.id)
  end
