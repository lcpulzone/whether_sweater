class WeatherFacade
  def self.current_daily_hourly_weather(lan, lng)
    current_weather = WeatherService.find_current_daily_hourly_weather(lan, lng)
    test = WeatherPoro.new(current_weather)
  end
end
