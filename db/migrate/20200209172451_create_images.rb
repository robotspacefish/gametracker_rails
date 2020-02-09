class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :height
      t.string :width
      t.integer :image_id
      t.string :url
      t.string :type
      t.integer :game_id

      t.timestamps
    end
  end
end
