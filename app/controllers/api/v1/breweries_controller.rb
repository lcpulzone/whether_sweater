class Api::V1::BreweriesController < ApplicationController
  def index
    location = params[:location]
    breweries = BreweriesFacade.list_of_breweries_by_location(location)
    render json: BreweriesForecastSerializer.new(breweries)
  end
end
