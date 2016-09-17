class RenameHydrationTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :hydrations, :hydration_packs
  end
end
