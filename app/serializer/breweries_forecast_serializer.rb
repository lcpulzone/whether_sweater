class BreweriesForecastSerializer
  include JSONAPI::Serializer

  set_type :breweries
  attributes :destination, :forecast, :breweries
end
