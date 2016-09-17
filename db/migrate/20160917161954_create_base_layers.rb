class CreateBaseLayers < ActiveRecord::Migration[5.0]
  def change
    create_table :base_layers do |t|

      t.timestamps
    end
  end
end
