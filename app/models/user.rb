class User < ApplicationRecord
  has_secure_password

  validates :username, :email, presence: true, uniqueness: { case_sensitive: false }

  has_many :owned_games
  has_many :games_platforms, through: :owned_games
  has_many :games, through: :games_platforms
  scope :sort_by_username, -> { order(:username) }

  def owns_game_platform?(g_id, p_id)
    gp = GamesPlatform.find_by(game_id: g_id, platform_id: p_id)
    self.games_platforms.include?(gp)
  end


end