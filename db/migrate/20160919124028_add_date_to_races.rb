class AddDateToRaces < ActiveRecord::Migration[5.0]
  def change
    add_column :races, :date, :datetime
  end
end
