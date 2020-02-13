class OwnedGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  has_many :notes

  def self.create_owned_game_from_params(params)
    gps = params[:platform_ids].filter { |p_id| !p_id.blank? }.collect do |p_id|
      GamesPlatform.find_by_ids(params[:game_id], p_id)

    if game && !gps.empty?
      return gps.collect do |gp|
        OwnedGame.new(games_platform_id: gp.id,  completed: params["completed"],
      currently_playing: params["currently_playing"],
      want_to_play: params["want_to_play"] )
      end
    else
      return nil
    end
  end
end