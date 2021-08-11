class RoadtripPoro
  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(origin, destination, raw_roadtrip_data, raw_weather_data)
    @id = nil
    @start_city = origin
    @end_city = destination
    @travel_time = is_traveling_possible(raw_roadtrip_data)
    @weather_at_eta = weather_data(raw_roadtrip_data, raw_weather_data)
  end

  def is_traveling_possible(raw_roadtrip_data)
    if raw_roadtrip_data[:route][:routeError][:errorCode] == 2
      'Impossible'
    else
      raw_roadtrip_data[:route][:formattedTime]
    end
  end

  def weather_data(raw_roadtrip_data, raw_weather_data)
    if raw_roadtrip_data[:route][:routeError][:errorCode] == 2
      {}
    elsif raw_roadtrip_data[:route][:realTime] <= 172800
      index = (raw_roadtrip_data[:route][:realTime] / 3600) - 1
      {
        temperature: raw_weather_data[:hourly][index][:temp],
        conditions: raw_weather_data[:hourly][index][:weather][0][:description]
      }
    elsif raw_roadtrip_data[:route][:realTime] >= 172801
      index = (raw_roadtrip_data[:route][:realTime] / 86400) - 1
      {
        temperature: raw_weather_data[:daily][index][:temp][:day],
        conditions: raw_weather_data[:daily][index][:weather][0][:description]
      }
    end
  end
end
