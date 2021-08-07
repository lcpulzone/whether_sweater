require 'rails_helper'

RSpec.describe 'Map Service Spec' do
  # before :each do
  #   VCR.turn_on!
  # end

  describe 'response' do
    it 'can get a response' do
      # VCR.use_cassette 'map_response' do
        expect(MapService.latlng).to eq(10)
      # end
    end
  end
end
