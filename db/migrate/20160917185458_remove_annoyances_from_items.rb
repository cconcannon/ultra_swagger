class RemoveAnnoyancesFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :annoyances
    rename_column :items, :performance, :avg_rating
  end
end
