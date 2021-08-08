require 'rails_helper'

RSpec.describe 'Weather Service' do
  before :each do
    # WebMock.allow_net_connect!
    # VCR.turn_off!
    VCR.turn_on!
  end

  describe 'initial response' do
    it 'can get a response with ' do
      VCR.use_cassette 'weather_response' do
        actual = WeatherService.find_current_daily_hourly_weather(44.058088, -121.31515)

        expect(actual.class).to eq(Hash)
        expect(actual[:current].size).to eq(15)
        expect(actual[:hourly].length).to eq(48)
        expect(actual[:daily].length).to eq(8)
        expect(actual[:minutely])
      end
    end
  end
end
