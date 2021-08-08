require 'rails_helper'

RSpec.describe 'Weather Poro' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  describe 'current, daily, hourly' do
    xit 'can return current weather attributes' do
      VCR.use_cassette 'current_weather_poro' do
        expect(actual)
      end
    end
  end
end
