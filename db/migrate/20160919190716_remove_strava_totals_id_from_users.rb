class RemoveStravaTotalsIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :strava_user_total_id
  end
end
