class Game < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  has_many :games_platforms
  has_many :platforms, through: :games_platforms

  has_many :owned_games
  has_many :users, through: :owned_games


  scope :sort_by_title, -> { order(:title) }

  def is_owned?
    !self.users.empty?
  end

  def which_platforms?(user)
    user.games_platforms.where(game_id: self.id).joins(:platform).pluck(:name)
  end

end
