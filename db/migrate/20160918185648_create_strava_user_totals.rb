class CreateStravaUserTotals < ActiveRecord::Migration[5.0]
  def change
    create_table :strava_user_totals do |t|
      t.references :user, foreign_key: true
      t.integer :avg_weekly_distance
      t.decimal :avg_weekly_time
      t.integer :avg_weekly_elevation_gain

      t.timestamps
    end
  end
end
