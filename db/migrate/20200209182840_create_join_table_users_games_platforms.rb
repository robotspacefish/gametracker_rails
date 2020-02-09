class CreateJoinTableUsersGamesPlatforms < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :games_platforms do |t|
      # t.index [:user_id, :games_platform_id]
      # t.index [:games_platform_id, :user_id]
      t.boolean :currently_playing
      t.boolean :want_to_play
      t.boolean :completed
    end
  end
end
