require 'rails_helper'

RSpec.describe 'Map Service Spec' do
  before :each do
    # WebMock.allow_net_connect!
    # VCR.turn_off!
    VCR.turn_on!
  end

  describe 'latitude & longitude' do
    it 'can get a response containing latitude and longitude' do
      VCR.use_cassette 'bend_latlng_response' do
        actual = MapService.latlng("bend,or")

        expect(actual.class).to eq(Hash)
        expect(actual[:results][0][:locations][0].size).to eq(22)
        expect(actual[:results][0][:locations][0][:latLng].class).to eq(Hash)
        expect(actual[:results][0][:locations][0][:latLng][:lat]).to eq(44.058088)
        expect(actual[:results][0][:locations][0][:latLng][:lng]).to eq(-121.31515)
      end
    end
  end

  describe 'roadtrip' do
    it 'can provide trip data' do
      VCR.use_cassette 'roadtrip_service' do
        actual = MapService.directions_to_and_from('denver,co', 'bend,or')

        expect(actual.class).to eq(Hash)
        expect(actual[:route][:formattedTime].class).to eq(String)
        expect(actual[:route][:formattedTime]).to eq("16:13:11")
      end
    end
  end
end
