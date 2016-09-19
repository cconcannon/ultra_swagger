class AddStravaUserTotalToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :strava_user_total
  end
end
