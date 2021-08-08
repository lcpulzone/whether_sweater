class WeatherService
  def self.find_current_daily_hourly_weather(lat, lng)
    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&exclude=minutely,alerts&appid=#{ENV['OW_API_KEY']}")
    test = parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

private
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org')
  end
end
