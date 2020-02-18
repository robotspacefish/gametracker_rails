class Game < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  has_many :games_platforms
  has_many :platforms, through: :games_platforms

  has_many :owned_games
  has_many :users, through: :owned_games

  scope :sort_by_title, -> { order("lower(title)") }
  scope :last_added, -> { order(created_at: :desc).limit(1) }
  scope :recently_added, -> { order(created_at: :desc).limit(3).distinct }
  scope :total_by_title, -> { count }

  def is_owned?
    !self.users.empty?
  end

  def which_platforms?(user)
    user.games_platforms.where(game_id: self.id).joins(:platform).pluck(:name)
  end

  def on_multiple_platforms?
    self.platforms.size > 1
  end

  def get_added_by_username
    user = User.find_by(id: self.added_by)
    user ? user.username : nil
  end

  def self.exists_by_title?(title)
    Game.where("LOWER(title) LIKE ?", title).take
  end
end
