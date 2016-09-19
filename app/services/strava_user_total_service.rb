class StravaUserTotalService
  def initialize(strava_user)
    @strava_user = strava_user
    @conn = Faraday.new("https://www.strava.com/api/v3/")
    @conn.params = { 'access_token' => strava_user.token }
  end
  
  def user_totals
    response = @conn.get "athletes/#{@strava_user.strava_id}/stats"
    parse(response.body)
  end
  
  def parse(input)
    JSON.parse(input, symbolize_names: true)
  end
end