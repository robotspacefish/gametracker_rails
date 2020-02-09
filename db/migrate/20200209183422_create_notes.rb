class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.string :type
      t.integer :games_platforms_user_id

      t.timestamps
    end
  end
end
