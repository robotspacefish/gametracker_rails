class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :url
      t.string :summary
      t.string :igdb_id
      t.boolean :custom

      t.timestamps
    end
  end
end
