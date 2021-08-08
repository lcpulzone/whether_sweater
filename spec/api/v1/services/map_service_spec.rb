require 'rails_helper'

RSpec.describe 'Map Service Spec' do
  before :each do
    VCR.turn_on!
  end

  describe 'response' do
    it 'can get a response' do
      # WebMock.allow_net_connect!
      # VCR.turn_off!
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
end
