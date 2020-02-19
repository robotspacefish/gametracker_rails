class AddColumnStatusToOwnedGames < ActiveRecord::Migration[6.0]
  def change
    add_column :owned_games, :status, :string
  end
end
