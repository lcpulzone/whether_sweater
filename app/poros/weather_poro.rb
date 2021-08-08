class WeatherPoro
  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(current_weather)
    @datetime = Time.at(current_weather[:current][:dt]).strftime("%B %d, %I:%M %p %z")
    @sunrise = Time.at(current_weather[:current][:sunrise]).strftime("%B %d, %I:%M %p %z")
    @sunset = Time.at(current_weather[:current][:sunset]).strftime("%B %d, %I:%M %p %z")
    @temperature = current_weather[:current][:temp]
    @feels_like = current_weather[:current][:feels_like]
    @humidity = current_weather[:current][:humidity]
    @uvi = current_weather[:current][:uvi]
    @visibility = current_weather[:current][:visibility]
    @conditions = current_weather[:current][:weather][0][:description]
    @icon = current_weather[:current][:weather][0][:icon]
  end
end
# @datetime = Time.at(current_weather[:current][:dt]).to_s
# @sunrise = Time.at(current_weather[:current][:sunrise]).to_s
# @sunset = Time.at(current_weather[:current][:sunset]).to_s
