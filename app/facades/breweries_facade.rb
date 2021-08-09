class BreweriesFacade
  def self.list_of_breweries_by_location(location)
    locate = MapService.latlng(location)
    lat = locate[:results][0][:locations][0][:latLng][:lat]
    lng = locate[:results][0][:locations][0][:latLng][:lng]
    forecast_data = WeatherService.find_current_daily_hourly_weather(lat, lng)
    brewery_data = BreweriesService.find_breweries_by_latlng(lat, lng)

    BreweryForecastPoro.new(locate, forecast_data, brewery_data)
  end
end
