class MapService
  def self.latlng(location)
    response = conn.get("/geocoding/v1/address?key=#{ENV['MQD_API_KEY']}&location=#{location}")
    test = parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

private
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
