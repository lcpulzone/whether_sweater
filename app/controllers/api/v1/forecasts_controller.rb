class Api::V1::ForecastsController < ApplicationController
  def index
    location = params[:location]
    weather = WeatherFacade.current_daily_hourly_weather(location)
    render json: ForecastSerializer.new(weather)
  end
end
