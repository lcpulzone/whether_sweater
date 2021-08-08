class WeatherFacade
  def self.current_daily_hourly_weather(lan, lng)
    data = WeatherService.find_current_daily_hourly_weather(lan, lng)
    ForecastPoro.new(data)
  end
end
