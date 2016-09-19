class AddColumnsApprovedReviewedToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :approved, :boolean
    add_column :reviews, :reviewed, :boolean
    add_column :reviews, :admin_comments, :string
  end
end
