class RemoveReviewFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_reference :items, :review
  end
end
