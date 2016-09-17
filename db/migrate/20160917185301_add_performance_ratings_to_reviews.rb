class AddPerformanceRatingsToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :rating, :integer
  end
end
