class OwnedGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  has_many :notes

  def get_status
    self.completed ? "Completed" :
    self.currently_playing ? "Currently Playing" :
    "Want to Play"
  end

  def self.remove_blanks_from_array(array)
    array.filter! { |data| !data.blank? }
  end

  def self.get_game_platforms(params)
    remove_blanks_from_array(params[:platform_ids]).collect do |p_id|
      GamesPlatform.find_by_ids(params[:game_id], p_id)
    end
  end

  def self.create_owned_games_from_params(params, user_id)
    gps = get_game_platforms(params)

    return false if gps.empty?
    og = OwnedGame.new(
      user_id: user_id,
      game_id: params["game_id"],
      completed: params["completed"],
      currently_playing: params["currently_playing"],
      want_to_play: params["want_to_play"]
    )

    owned_games = []

    if og.save
      owned_games = gps.collect do |gp|
      ogs = OwnedGamesPlatform.new(user_id: user_id, games_platform_id: gp.id)
      ogs.save
      end
    end

    owned_games.all?
  end
end