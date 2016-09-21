class StravaUserTotalService
  
  def initialize(strava_user)
    @strava_user = strava_user
    @conn = Faraday.new("https://www.strava.com/api/v3/")
    @conn.params = { 'access_token' => strava_user.token }
  end
  
  def data
    response = @conn.get "athletes/#{@strava_user.strava_id}/stats"
    all_data = parse(response.body)
  end
  
  def parse(input)
    JSON.parse(input, symbolize_names: true)
  end
  
  def save_user_run_totals
    extracted_data = format_strava_api_data(data[:ytd_run_totals])
    s = StravaUserTotal.new(extracted_data)
    s.user = @strava_user
    s.save
  end
  
  def format_strava_api_data(api_data)
    { avg_weekly_distance: get_avg_weekly_distance(api_data[:distance]),
      avg_weekly_time: get_avg_weekly_time(api_data[:moving_time]),
      avg_weekly_elevation_gain: 
        get_avg_weekly_elevation_gain(api_data[:elevation_gain]),
      avg_speed: get_avg_speed(
        api_data[:distance].format_to_mi, 
        api_data[:moving_time].format_to_hrs
      )
    }
  end

  def get_avg_weekly_distance(ytd_distance)
    raw_weekly_avg = compute_weekly_average(ytd_distance)
    new_value = format_to_mi(raw_weekly_avg)
  end
  
  def get_avg_weekly_time(ytd_time)
    raw_weekly_avg = compute_weekly_average(ytd_time)
    new_value = format_to_hrs(raw_weekly_avg)
  end
  
  def get_avg_weekly_elevation_gain(ytd_elev_gain)
    raw_weekly_avg = compute_weekly_average(ytd_elev_gain)
    new_value = format_to_ft(raw_weekly_avg)
  end
  
  def get_avg_speed(distance, time)
    new_value = (distance/time).round(2)
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