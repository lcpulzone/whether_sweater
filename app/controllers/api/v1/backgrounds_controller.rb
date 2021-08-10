class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]
    image_information = BackgroundImageFacade.background_image_info(location)
    render json: BackgroundImageSerializer.new(image_information)
  end
end
