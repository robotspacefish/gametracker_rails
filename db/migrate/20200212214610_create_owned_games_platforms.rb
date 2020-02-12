class CreateOwnedGamesPlatforms < ActiveRecord::Migration[6.0]
  def change
    create_table :owned_games_platforms do |t|
      t.belongs_to :user
      t.belongs_to :game_platform
    end
  end
end
