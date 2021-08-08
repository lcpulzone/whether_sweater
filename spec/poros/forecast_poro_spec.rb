require 'rails_helper'

RSpec.describe 'Forecast Poro' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  describe 'current, daily, hourly' do
    it 'can return current weather attributes' do
      # VCR.use_cassette 'forecast_poro' do

      # end
    end
  end
end
