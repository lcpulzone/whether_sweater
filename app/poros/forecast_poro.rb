class ForecastPoro
  attr_reader :id, :current_weather, :daily_weather, :hourly_weather

  def initialize(data)
    @id = nil
    @current_weather = current(data[:current])
    @daily_weather = daily(data[:daily]).take(5)
    @hourly_weather = hourly(data[:hourly]).take(8)
  end

  def current(data)
    {
      datetime: Time.at(data[:dt]).strftime("%B %d, %I:%M %p %z"),
      sunrise: Time.at(data[:sunrise]).strftime("%B %d, %I:%M %p %z"),
      sunset: Time.at(data[:sunset]).strftime("%B %d, %I:%M %p %z"),
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather][0][:description],
      icon: data[:weather][0][:icon]
    }
  end

  def daily(data)
    data.map do |day|
      {
        date: Time.at(day[:dt]).strftime("%B %d, %Y"),
        sunrise: Time.at(day[:sunrise]).strftime("%B %d, %I:%M %p %z"),
        sunset: Time.at(day[:sunset]).strftime("%B %d, %I:%M %p %z"),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
  end

  def hourly(data)
    data.map do |hour|
      {
        time: Time.at(hour[:dt]).strftime("%I:%M %p"),
        temperature: hour[:temp],
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
      }
    end
  end
end
