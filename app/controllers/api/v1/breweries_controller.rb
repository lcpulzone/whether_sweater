class Api::V1::BreweriesController < ApplicationController
  def index
    if params[:quantity].to_i > 0
      location = params[:location]
      quantity = (params[:quantity]).to_i
      breweries = BreweriesFacade.list_of_breweries_by_location(location, quantity)
      render json: BreweriesForecastSerializer.new(breweries)
    else
      render json: {error: "Please enter a brewery quantity"}
    end
  end
end
