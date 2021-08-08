class WeatherPoro
  attr_reader :sunrise, :sunset, :temp, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(current_weather)
    @datetime = Time.new.strftime("%F")
    @sunrise = current_weather[:current][:sunrise]
    @sunset = current_weather[:current][:sunset]
    @temperature = current_weather[:current][:temp]
    @feels_like = current_weather[:current][:feels_like]
    @humidity = current_weather[:current][:humidity]
    @uvi = current_weather[:current][:uvi]
    @visibility = current_weather[:current][:visibility]
    @conditions = current_weather[:current][:weather][0][:description]
    @icon = current_weather[:current][:weather][0][:icon]
  end
end
