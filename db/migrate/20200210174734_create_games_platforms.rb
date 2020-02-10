class CreateGamesPlatforms < ActiveRecord::Migration[6.0]
  def change
    create_table :games_platforms do |t|
      t.belongs_to :game
      t.belongs_to :platform
    end
  end
end
