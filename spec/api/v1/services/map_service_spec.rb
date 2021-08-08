require 'rails_helper'

RSpec.describe 'Map Service Spec' do
  describe 'response' do
    it 'can get a response' do
      WebMock.allow_net_connect!
      VCR.turn_off!
      # VCR.use_cassette 'bend_latlng_response' do
        expect(MapService.latlng("bend,or").class).to eq(Hash)
        expect(MapService.latlng("bend,or")[:results][0][:locations][0].size).to eq()
      # end
    end
  end
end
