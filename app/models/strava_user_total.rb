class StravaUserTotal < ApplicationRecord
  belongs_to :user
  
  def service
    @service ||= StravaUserTotalService.new(user)
  end
  
  def update_data
    update_avg_weekly_distance
    update_avg_weekly_time
    update_avg_weekly_elevation_gain
    update_avg_speed
  end
  
  
  
  private
  
  def update_avg_weekly_distance
    raw_ytd_num = service.user_totals[:ytd_run_totals][:distance] || 0
    raw_weekly_avg = compute_weekly_average(raw_ytd_num)
    new_value = format_to_mi(raw_weekly_avg)
    self.update_attribute(:avg_weekly_distance, new_value)
  end
  
  def update_avg_weekly_time
    raw_ytd_num = service.user_totals[:ytd_run_totals][:moving_time] || 0
    raw_weekly_avg = compute_weekly_average(raw_ytd_num)
    new_value = format_to_hrs(raw_weekly_avg)
    self.update_attribute(:avg_weekly_time, new_value)
  end
  
  def update_avg_weekly_elevation_gain
    raw_ytd_num = service.user_totals[:ytd_run_totals][:elevation_gain] || 0
    raw_weekly_avg = compute_weekly_average(raw_ytd_num)
    new_value = format_to_ft(raw_weekly_avg)
    self.update_attribute(:avg_weekly_elevation_gain, new_value)
  end
  
  def update_avg_speed
    new_value = (avg_weekly_distance/avg_weekly_time).round(2)
    self.update_attribute(:avg_speed, new_value)
  end
  
  def compute_weekly_average(input)
    recent_new_year = Time.now.year.to_s + "-01-01"
    days = (Time.now.to_date - recent_new_year.to_date).to_i
    weeks = days/7
    input/weeks
  end
  
  def format_to_mi(meters)
    (meters/1609.344).to_i
  end
  
  def format_to_hrs(seconds)
    (seconds/3600).round(1)
  end
  
  def format_to_ft(meters)
    (meters * 3.28084).to_i
  end
end
