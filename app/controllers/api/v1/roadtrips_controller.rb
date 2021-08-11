class Api::V1::RoadtripsController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil? == false
      origin = params[:origin]
      destination = params[:destination]
      trip = RoadtripFacade.roadtrip_info(origin, destination)
      test = render json: RoadtripsSerializer.new(trip), status: 200
    else
      render json: { error: "Woah, you can't drive there. Can I suggest traveling via boat or plane?" }
    end
  end
end
