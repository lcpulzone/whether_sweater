class BackgroundImageFacade
  def self.background_image_info(location)
    image_data = BackgroundImageService.find_location_image(location)
    test = BackgroundImagePoro.new(location, image_data)
  end
end
