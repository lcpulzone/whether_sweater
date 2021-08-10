class RoadtripPoro
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(roadtrip_data)
    @start_city = roadtrip_data[:]
    @end_city = roadtrip_data[:]
    @travel_time = roadtrip_data[:]
    @weather_at_eta = weather_data(roadtrip_data)
  end

  def weather_data(roadtrip_data)
    {
      temperature: roadtrip_data[:temp],
      conditions: roadtrip_data[:description]
    }
  end
end
