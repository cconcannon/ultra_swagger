class AddImagePathToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :image_path, :string
  end
end
