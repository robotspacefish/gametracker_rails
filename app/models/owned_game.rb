class OwnedGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  has_many :notes

  def self.statuses
    ["Want To Play", "Currently Playing", "Completed"]
  end

  scope :recently_added, -> { order(created_at: :desc).limit(3).distinct }

  # def get_status
  #   self.status.split('_').each { |word| word.capitalize! }.join(' ')
  # end

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
      status: params["status"]
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