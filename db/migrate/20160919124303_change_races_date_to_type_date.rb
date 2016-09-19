class ChangeRacesDateToTypeDate < ActiveRecord::Migration[5.0]
  def change
    change_column :races, :date, :date
  end
end
