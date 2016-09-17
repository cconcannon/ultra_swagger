class CreateShoes < ActiveRecord::Migration[5.0]
  def change
    create_table :shoes do |t|

      t.timestamps
    end
  end
end
