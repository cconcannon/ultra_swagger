class ChangeDefaultValuesOnReviews < ActiveRecord::Migration[5.0]
  def change
    change_column_default :reviews, :approved, false
    change_column_default :reviews, :reviewed, false
  end
end
