class MapService
  def self.latlng(location)
    response = conn.get("/geocoding/v1/address?key=#{ENV['MQD_API_KEY']}&location=#{location}")
    parse_json(response)
  end

  def self.directions_to_and_from(from, to)
    response = conn.get("/directions/v2/route?key=#{ENV['MQD_API_KEY']}&from=#{from}&to=#{to}")
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

private
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
