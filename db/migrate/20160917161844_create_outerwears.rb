class CreateOuterwears < ActiveRecord::Migration[5.0]
  def change
    create_table :outerwears do |t|

      t.timestamps
    end
  end
end
