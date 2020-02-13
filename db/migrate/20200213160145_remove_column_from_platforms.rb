class RemoveColumnFromPlatforms < ActiveRecord::Migration[6.0]
  def change

    remove_column :platforms, :slug, :string
  end
end
