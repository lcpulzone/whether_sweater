class WeatherFacade
  def self.current_daily_hourly_weather(location)
    locate = MapService.latlng(location)
    lat = locate[:results][0][:locations][0][:latLng][:lat]
    lng = locate[:results][0][:locations][0][:latLng][:lng]
    data = WeatherService.find_current_daily_hourly_weather(lat, lng)
    ForecastPoro.new(data)
  end

  def self.weather_on_arrival(location)
    locate = MapService.latlng(location)
    lat = locate[:results][0][:locations][0][:latLng][:lat]
    lng = locate[:results][0][:locations][0][:latLng][:lng]
    data = WeatherService.find_current_daily_hourly_weather(lat, lng)
  end
end
