class ModifyItemAttributes < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :rating
    change_column_default :items, :image_path, "/assets/image_not_found.jpg"
  end
end
