class BreweriesFacade
  def self.list_of_breweries_by_location(location)
    locate = MapService.latlng(location)
    lat = locate[:results][0][:locations][0][:latLng][:lat]
    lng = locate[:results][0][:locations][0][:latLng][:lng]
    brewery_data = BreweriesService.find_breweries_by_latlng(lat, lng)

    brewery_data.map do |data|
      BreweriesPoro.new(
        id: data[:id],
        name: data[:name],
        brewery_type: data[:brewery_type]
      )
    end
  end
end
