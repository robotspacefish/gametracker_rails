class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.boolean :completed
      t.belongs_to :owned_game

      t.timestamps
    end
  end
end
