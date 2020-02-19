module GamesHelper
  def owned_platforms_as_string(user, game)
    game.which_platforms?(user).join(' | ')
  end
end
