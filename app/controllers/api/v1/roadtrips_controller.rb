class Api::V1::RoadtripsController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    trip = RoadtripFacade.roadtrip_info(params[:origin], params[:destination])

    if user.nil? == false
      test = render json: RoadtripsSerializer.new(trip), status: 200
    elsif user.nil?
      render json: { error: "You are not authorized" }, status: 401
    end
  end
end
