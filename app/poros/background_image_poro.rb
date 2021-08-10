class BackgroundImagePoro
  attr_reader :location, :description, :image_urls, :credit

  def initialize(location, image_data)
    @location = location
    @description = image_data[:results][0][:alt_description]
    @image_urls = all_image_urls(image_data[:results][0][:urls])
    @credit = credit_info(image_data[:results][0][:user])
  end

  def all_image_urls(image_data)
    {
      raw: image_data[:raw],
      full: image_data[:full],
      regular: image_data[:regular],
      small: image_data[:small],
      thumb: image_data[:thumb]
    }
  end

  def credit_info(image_data)
    {
      name: image_data[:name],
      self: image_data[:links][:self],
      html: image_data[:links][:html],
      photos: image_data[:links][:photos],
      portfolio: image_data[:links][:portfolio]
    }
  end
end
