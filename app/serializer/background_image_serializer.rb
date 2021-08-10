class BackgroundImageSerializer
  include JSONAPI::Serializer

  set_type :image
  attributes :location, :description, :image_urls, :credit
end
