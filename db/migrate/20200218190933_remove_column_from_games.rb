class RemoveColumnFromGames < ActiveRecord::Migration[6.0]
  def change

    remove_column :games, :igdb_id, :string
  end
end
