class BreweriesPoro
  attr_reader :id, :name, :brewery_type

  def initialize(brewery_data)
    @id = brewery_data[:id]
    @name = brewery_data[:name]
    @brewery_type = brewery_data[:brewery_type]
  end
end
