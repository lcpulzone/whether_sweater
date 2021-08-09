class Api::V1::BreweriesController < ApplicationController
  def index
    location = params[:location]
    quantity = (params[:quantity]).to_i
    breweries = BreweriesFacade.list_of_breweries_by_location(location, quantity)
    render json: BreweriesForecastSerializer.new(breweries)
  end
end
