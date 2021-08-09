require 'rails_helper'

RSpec.describe 'Weather Facade' do
  before :each do
    # WebMock.allow_net_connect!
    # VCR.turn_off!
    VCR.turn_on!
  end

  describe 'current, daily, hourly' do
    it 'can give the current weather' do
      VCR.use_cassette 'facade_bend_current_weather' do
        actual = WeatherFacade.current_daily_hourly_weather('bend,or')

        expect(actual.class).to eq(ForecastPoro)
        expect(actual.current_weather[:datetime]).to eq("August 08, 06:34 PM -0700")
        expect(actual.current_weather[:sunset]).to eq("August 08, 08:20 PM -0700")
        expect(actual.current_weather[:temperature]).to eq(71.83)
        expect(actual.current_weather[:feels_like]).to eq(70.18)
        expect(actual.current_weather[:conditions]).to eq("clear sky")
      end
    end

    it 'does not give attributes that are not needed' do
      VCR.use_cassette 'facade_bend_current_weather' do
        actual = WeatherFacade.current_daily_hourly_weather('bend,or')

        expect(actual.current_weather[:pressure].nil?).to eq(true)
      end
    end
  end
end
