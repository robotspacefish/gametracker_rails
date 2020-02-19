class RemoveStatusColumnsFromOwnedGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :owned_games, :want_to_play, :boolean
    remove_column :owned_games, :currently_playing, :boolean
    remove_column :owned_games, :completed, :boolean
  end
end
