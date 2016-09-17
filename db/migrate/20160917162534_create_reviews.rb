class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :race, foreign_key: true
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.text :comments

      t.timestamps
    end
  end
end
