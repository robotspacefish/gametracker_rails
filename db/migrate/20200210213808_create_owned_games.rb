class CreateOwnedGames < ActiveRecord::Migration[6.0]
  def change
    create_table :owned_games do |t|
      t.belongs_to :user
      t.belongs_to :games
      t.boolean :currently_playing
      t.boolean :want_to_play
      t.boolean :completed

      t.timestamps
    end
  end
end
