class User < ApplicationRecord
  has_secure_password

  validates :username, :email, presence: true, uniqueness: { case_sensitive: false }

  has_many :owned_games
  has_many :games, through: :owned_games

  has_many :owned_games_platforms
  has_many :games_platforms, through: :owned_games_platforms


  scope :sort_by_username, -> { order(:username) }

  def recently_added_games
    self.owned_games.recently_added.collect do |og|
      Game.find_by(id: og.game_id)
    end
  end

  def owns_game_platform?(g_id, p_id)
    gp = GamesPlatform.find_by(game_id: g_id, platform_id: p_id)
    self.games_platforms.include?(gp)
  end

  def owns_game_by_title?(title)
    self.games.find_by(title: title)
  end

  def owns_game_by_instance?(game)
    self.games.include?(game)
  end

  def owns_game_by_id?(g_id)
    self.games.find_by(id: g_id)
  end

  def add_game_by_game_and_platform(game, platform)
    self.games << game
    add_games_platform_by_game_and_platform(game, platform)
  end

  def add_game_by_games_platform(games_platform)
    self.games << Game.find_by(id: games_platform.game_id)
    self.games_platforms << games_platform
  end

  def add_games_platform_by_game_and_platform(game, platform)
    self.games_platforms << GamesPlatform.find_by_ids(game.id, platform.id)
  end

  def currently_playing
    Game.joins(:owned_games).where('user_id = ? AND status = ?', self.id, "Currently Playing")
  end

  def find_owned_game_by_game_id(g_id)
    self.owned_games.find_by(game_id: g_id)
  end

  def owns_game_on_all_platforms?(game)
    self.games.find_by(id: game.id).which_platforms?(self).size == game.platforms.size
  end

  def delete_from_collection(game)
    self.owned_games.find_by(game_id: game.id).destroy
    ogs = OwnedGamesPlatform.joins(:games_platform).where("user_id = ? AND game_id = ?", self.id, game.id)
    ogs.destroy_all
  end

  def added_game?(game)
    self.id == game.added_by
  end

  def get_avatar_url
    "https://robohash.org/#{self.username}"
  end
end