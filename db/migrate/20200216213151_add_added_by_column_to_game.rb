class AddAddedByColumnToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :added_by, :integer
  end
end
