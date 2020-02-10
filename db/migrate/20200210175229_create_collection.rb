class CreateCollection < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.belongs_to :user
      t.belongs_to :games_platform
      t.boolean :currently_playing
      t.boolean :want_to_play
      t.boolean :completed

      t.timestamps
    end
  end
end