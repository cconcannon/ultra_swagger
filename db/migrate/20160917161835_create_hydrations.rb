class CreateHydrations < ActiveRecord::Migration[5.0]
  def change
    create_table :hydrations do |t|

      t.timestamps
    end
  end
end
