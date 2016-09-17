class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.string :name
      t.string :location
      t.string :distance
      t.string :temp_high
      t.string :temp_low
      t.string :trail_attr
      t.string :climate

      t.timestamps
    end
  end
end
