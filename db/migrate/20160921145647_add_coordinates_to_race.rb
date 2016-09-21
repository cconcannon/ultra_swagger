class AddCoordinatesToRace < ActiveRecord::Migration[5.0]
  def change
    add_column :races, :lat, :float
    add_column :races, :lon, :float
  end
end
