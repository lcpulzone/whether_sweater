require 'rails_helper'

RSpec.describe 'Weather Facade' do
  before :each do
    # WebMock.allow_net_connect!
    # VCR.turn_off!
    VCR.turn_on!
  end

  describe 'current attribute' do
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

        expect(actual.current_weather.size).to_not eq(15)
        expect(actual.current_weather[:pressure].nil?).to eq(true)
        expect(actual.current_weather[:clouds].nil?).to eq(true)
        expect(actual.current_weather[:wind_speed].nil?).to eq(true)
        expect(actual.current_weather[:wind_deg].nil?).to eq(true)
        expect(actual.current_weather[:rain].nil?).to eq(true)
      end
    end
  end

  describe 'daily attribute' do
    it 'can give the daily weather' do
      VCR.use_cassette 'facade_bend_current_weather' do
        actual = WeatherFacade.current_daily_hourly_weather('bend,or')

        expect(actual.daily_weather.size).to eq(5)
        expect(actual.daily_weather[0].size).to eq(7)
        expect(actual.daily_weather.class).to eq(Array)
        expect(actual.daily_weather[0].class).to eq(Hash)
        expect(actual.daily_weather[0][:max_temp].class).to eq(Float)
        expect(actual.daily_weather[0][:date]).to eq("August 08, 2021")
        expect(actual.daily_weather[0][:sunrise]).to eq("August 08, 06:01 AM -0700")
      end
    end

    it 'does not give attributes that are not needed' do
      VCR.use_cassette 'facade_bend_current_weather' do
        actual = WeatherFacade.current_daily_hourly_weather('bend,or')

        expect(actual.daily_weather[0].size).to_not eq(15)
        expect(actual.daily_weather[0][:moonrise].nil?).to eq(true)
        expect(actual.daily_weather[0][:moon_set].nil?).to eq(true)
        expect(actual.daily_weather[0][:temp].nil?).to eq(true)
      end
    end
  end

  describe 'hourly attribute' do
    it 'can give the hourly weather' do
      VCR.use_cassette 'facade_bend_current_weather' do
        actual = WeatherFacade.current_daily_hourly_weather('bend,or')

        expect(actual.hourly_weather.size).to eq(8)
        expect(actual.hourly_weather[0].size).to eq(4)
        expect(actual.hourly_weather.class).to eq(Array)
        expect(actual.hourly_weather[0].class).to eq(Hash)
        expect(actual.hourly_weather[0][:time].class).to eq(String)
        expect(actual.hourly_weather[0][:conditions]).to eq("clear sky")
        expect(actual.hourly_weather[0][:icon]).to eq("01d")
      end
    end

    it 'does not give attributes that are not needed' do
      VCR.use_cassette 'facade_bend_current_weather' do
        actual = WeatherFacade.current_daily_hourly_weather('bend,or')

        expect(actual.hourly_weather[0].size).to_not eq(22)
        expect(actual.hourly_weather[0][:feels_like].nil?).to eq(true)
        expect(actual.hourly_weather[0][:coulds].nil?).to eq(true)
        expect(actual.hourly_weather[0][:visibility].nil?).to eq(true)
        expect(actual.hourly_weather[0][:windgust].nil?).to eq(true)
      end
    end
  end
end
