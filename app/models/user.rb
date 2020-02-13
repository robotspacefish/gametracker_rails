class User < ApplicationRecord
  has_secure_password

  validates :username, :email, presence: true, uniqueness: { case_sensitive: false }

  has_many :owned_games
  has_many :games, through: :owned_games

  has_many :owned_games_platforms
  has_many :games_platforms, through: :owned_games_platforms


  scope :sort_by_username, -> { order(:username) }

  def owns_game_platform?(g_id, p_id)
    gp = GamesPlatform.find_by(game_id: g_id, platform_id: p_id)
    self.games_platforms.include?(gp)
  end

  def add_games_platform_by_game_and_platform(game, platform)
    self.games_platforms << GamesPlatform.find_by_ids(game.id, platform.id)
  end

end