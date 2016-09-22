class Review < ApplicationRecord
  belongs_to :race
  belongs_to :user
  belongs_to :item
  belongs_to :strava_user_total
  
  scope :by_item, -> { order(:item_id, created_at: "DESC") }
end
