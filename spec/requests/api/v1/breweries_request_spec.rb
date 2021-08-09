require 'rails_helper'

RSpec.describe 'Breweries Request' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
  end

  it 'can list the breweries, destination and forecast' do
    get '/api/v1/breweries?location=bend,or&quantity=5'

    brewery_details = JSON.parse(response.body, symbolize_names: true)

    expect(brewery_details.class).to eq(Hash)
    expect(brewery_details[:data].count).to eq(3)
    expect(brewery_details[:data][:attributes][:breweries].count).to eq(5)
  end
end
