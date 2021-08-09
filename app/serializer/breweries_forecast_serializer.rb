class BreweriesForecastSerializer
  include JSONAPI::Serializer

  set_id :id
  set_type :breweries
  attributes :destination, :forecast, :breweries
end
