class BackgroundImageService
  def self.find_location_image(location)
    response = conn.get("/search/photos?query=#{location}")
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

private
  def self.conn
    Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.headers[:Authorization] = "Client-ID #{ENV['UN_API_KEY']}"
    end
  end
end
