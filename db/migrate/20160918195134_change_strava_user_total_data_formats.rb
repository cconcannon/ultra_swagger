class ChangeStravaUserTotalDataFormats < ActiveRecord::Migration[5.0]
  def change
    change_column :strava_user_totals, :avg_weekly_time, :float
  end
end
