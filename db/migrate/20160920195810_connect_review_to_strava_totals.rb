class ConnectReviewToStravaTotals < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :strava_user_total
  end
end
