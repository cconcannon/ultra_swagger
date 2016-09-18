class StravaUserTotalService
  def initialize(token)
    @conn = Faraday.new("https://www.strava.com/api/v3/")
    @conn.params = { 'access_token' => token }
  end
end