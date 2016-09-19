class AddAvgSpeedToStravaUserTotals < ActiveRecord::Migration[5.0]
  def change
    add_column  :strava_user_totals, :avg_speed, :float
  end
end
