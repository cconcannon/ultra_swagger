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
    extracted_data = format_user_totals(data)
    s = StravaUserTotal.new(extracted_data)
    s.user = @strava_user
    s.save
  end
end