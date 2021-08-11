class RoadtripFacade
  def self.roadtrip_info(origin, destination)
    raw_roadtrip_data = MapService.directions_to_and_from(origin, destination)
    raw_weather_data = WeatherFacade.find_weather_for_latlng(destination)
    RoadtripPoro.new(origin, destination, raw_roadtrip_data, raw_weather_data)
  end
end
