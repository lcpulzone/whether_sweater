class BreweriesService
  def self.find_breweries_by_latlng(lat,lng)
    response = conn.get("/breweries?by_dist=#{lat},#{lng}")
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(url: 'https://api.openbrewerydb.org')
  end
end
