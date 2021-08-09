require 'rails_helper'

RSpec.describe 'Map Service Spec' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  it 'can find breweries by latitude & longitude' do
    actual = BreweriesService.find_breweries_by_latlng(44.058088,-121.31515)

    expect(actual.class).to eq(Array)
    expect(actual[0].class).to eq(Hash)
    expect(actual[0][:id]).to eq(12576)
    expect(actual[0][:name]).to eq("McMenamins Old St. Francis School")
    expect(actual[0][:brewery_type]).to eq("brewpub")
  end
end
