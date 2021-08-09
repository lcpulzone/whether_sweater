require 'rails_helper'

RSpec.describe 'Map Service Spec' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  it 'can list breweries in a location with proper attributes' do
    actual = BreweriesFacade.list_of_breweries_by_location('bend,or', 5)

    expect(actual.class).to eq(BreweryForecastPoro)
    expect(actual.breweries.count).to eq(5)
    expect(actual.breweries[0].count).to eq(3)
    expect(actual.breweries[0][:brewery_type].class).to eq(String)
    expect(actual.breweries[0][:id].class).to eq(Integer)
    expect(actual.breweries[0][:brewery_type].present?).to eq(true)
    expect(actual.breweries[0][:name].present?).to eq(true)
    expect(actual.breweries[0][:id].present?).to eq(true)
  end

  it 'can list the forecast in a location with proper attributes' do
    actual = BreweriesFacade.list_of_breweries_by_location('bend,or', 5)

    expect(actual.class).to eq(BreweryForecastPoro)
    expect(actual.forecast.class).to eq(Hash)
    expect(actual.forecast[:temperature].class).to eq(String)
  end
end
